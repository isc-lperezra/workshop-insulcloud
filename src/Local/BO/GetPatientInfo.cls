Class Local.BO.GetPatientInfo Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method InvokeInsulcloud(pRequest As Local.Message.PatientInfoRequest, Output pResponse As Local.Message.PatientInfoResponse) As %Status
{

    Set ..Adapter.URL = ..Adapter.URL_"/login"

    Set tResponse = ##class(%Net.HttpResponse).%New()

    Set tSC = ..Adapter.Post(.tResponse)

    If $$$ISERR(tSC) {
        Quit tSC
    }

    
    Set jsonResponse = {}.%FromJSON(tResponse.Data)

    $$$TRACE(jsonResponse.%Get("access_token"))

    return $$$OK
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Local.Message.PatientInfoRequest">
    <Method>InvokeInsulcloud</Method>
  </MapItem>
</MapItems>
}

}
