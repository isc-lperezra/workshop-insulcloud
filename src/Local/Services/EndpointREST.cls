Class Local.Services.EndpointREST Extends %CSP.REST
{

Parameter HandleCorsRequest = 0;

Parameter CHARSET = "utf-8";

Parameter CONVERTINPUTSTREAM = 1;

XData UrlMap [ XMLNamespace = "https://www.intersystems.com/urlmap" ]
{
<Routes>
	<Route Url="/test" Method="GET" Call="Test" />
</Routes>
}

ClassMethod OnHandleCorsRequest(url As %String) As %Status
{
	set url = %request.GetCgiEnv("HTTP_REFERER")
    set origin = $p(url,"/",1,3) // origin = "http(s)://origin.com:port"

    // here you can check specific origins
    // otherway, it will allow all origins (useful while developing only)

	do %response.SetHeader("Access-Control-Allow-Credentials","true")
	do %response.SetHeader("Access-Control-Allow-Methods","GET,POST,PUT,DELETE,OPTIONS")
	do %response.SetHeader("Access-Control-Allow-Origin",origin)
	do %response.SetHeader("Access-Control-Allow-Headers","Access-Control-Allow-Origin, Origin, X-Requested-With, Content-Type, Accept, Authorization, Cache-Control")
	quit $$$OK
}

ClassMethod Test() As %Status
{
    #Dim response AS Local.Message.PatientInfoResponse
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        
        set initialMessage = ##class(Local.Message.PatientInfoRequest).%New()

        set initialMessage.PatientId = %request.Get("patientId")

        set status = ##class(Ens.Director).CreateBusinessService("Local.BS.GenericBS", .instance)
       	
        set status = instance.SendRequestSync("Local.BP.GetPatientData", initialMessage, .response)
        
        set %response.Status = ..#HTTP200OK
        set tempStream = ##class(%Stream.TmpCharacter).%New()

        set len = response.PatientInfo.SizeGet()
        While len > 0 {
            set line=response.PatientInfo.Read($S(len>32656:32656,1:len))
            set len=len-$length(line)
            write line
        }

        Do ##class(%REST.Impl).%SetStatusCode("200")
        
    } Catch (ex) {
        Do ##class(%REST.Impl).%SetStatusCode("400")
        return ex.DisplayString()
    }
    Quit $$$OK
}

}
