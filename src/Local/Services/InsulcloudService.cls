Class Local.Services.InsulcloudService Extends %CSP.REST
{

Parameter HandleCorsRequest = 0;

Parameter CHARSET = "utf-8";

Parameter CONVERTINPUTSTREAM = 1;

XData UrlMap [ XMLNamespace = "https://www.intersystems.com/urlmap" ]
{
<Routes>
    <Route Url="/getPatientInfo" Method="GET" Call="GetPatientInfo" />
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

ClassMethod GetPatientInfo() As %Status
{
	set ret = $$$OK
    try {
        set patientId = %request.Get("PatientId")
        set facility = %request.Get("Facility")
        set array = []        
        
        do array.%Push({
            "Value1": ("255"),
            "Value2": ("A"),
            "Value3": ("Whatever")
        })
        
        set %response.Status = ..#HTTP200OK
        write array.%ToJSON()

    } catch ex {
        set %response.Status = ..#HTTP400BADREQUEST
        return ex.DisplayString()
    }
    quit ret
}

}
