Class Local.BO.GetPatientInfo Extends EnsLib.REST.Operation
{

Property Credentials As Ens.DataType.ConfigName;

Parameter SETTINGS = "Credentials";

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method InvokeInsulcloud(pRequest As Local.Message.PatientInfoRequest, Output pResponse As Local.Message.PatientInfoResponse) As %Status
{
  Try {
    
    #DIM tHttpResponse AS %Net.HttpResponse

    Set tHttpRequest = ##class(%Net.HttpRequest).%New()
    Set tHttpResponse = ##class(%Net.HttpResponse).%New()

    Set pResponse = ##class(Local.Message.PatientInfoResponse).%New()
    Set pResponse.Facility = pRequest.Facility
    Set pResponse.PatientId = pRequest.PatientId

    Do tHttpRequest.SetHeader("Authorization", "Bearer "_pRequest.Token)

    Set ..Adapter.URL = $PIECE(..Adapter.URL, "?", 1)_"?user="_pRequest.PatientId
    Set tSC = ..Adapter.SendFormDataArray(.tHttpResponse, "GET", tHttpRequest)

    If $$$ISOK(tSC) {
        Set pResponse.PatientInfo = tHttpResponse.Data
        
    } Else {
        $$$TRACE($SYSTEM.Status.GetErrorText(tSC))
        Do $System.Status.DisplayError(tSC)
    }

  }
  Catch ex {
    Set tSC=ex.AsStatus()
    $$$TRACE($SYSTEM.Status.GetErrorText(tSC))
  }

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
