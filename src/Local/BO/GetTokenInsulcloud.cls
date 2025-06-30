Class Local.BO.GetTokenInsulcloud Extends EnsLib.REST.Operation
{

Property Credentials As Ens.DataType.ConfigName;

Parameter SETTINGS = "Credentials";

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method InvokeInsulcloud(pRequest As Local.Message.PatientInfoRequest, Output pResponse As Local.Message.PatientInfoResponse) As %Status
{
  Try {
    Set pResponse = ##class(Local.Message.PatientInfoResponse).%New()
    Set pResponse.Facility = pRequest.Facility
    Set pResponse.PatientId = pRequest.PatientId
    
    If ..Adapter.Credentials'="" {


      Set credentialObj = ##class(Ens.Config.Credentials).%OpenId(..Adapter.Credentials)
    
      If $IsObject(credentialObj) {
        Set username = credentialObj.Username
        Set password = credentialObj.Password

        #DIM tHttpResponse AS %Net.HttpResponse
        #DIM tHttpRequest AS %Net.HttpRequest

        // Create HttpRequest object
        Set tHttpRequest = ##class(%Net.HttpRequest).%New()

        // Set Content-Type to x-www-form-urlencoded
        Set tHttpRequest.ContentType = "application/x-www-form-urlencoded"

        // Add form data
        Do tHttpRequest.InsertFormData("email", username)
        Do tHttpRequest.InsertFormData("password", password)

        // Make the POST call
        Set tHttpResponse = ##class(%Net.HttpResponse).%New()
        // Set tSC = tHttpRequest.Post("", .tHttpResponse)
        Set tSC = ..Adapter.SendFormData(.tHttpResponse,"POST",tHttpRequest,,)
        
        If $$$ISOK(tSC) {
            Set jsonResponse = {}.%FromJSON(tHttpResponse.Data)
            Set pResponse.Token = jsonResponse.%Get("idToken")
            
        } Else {
            Do $System.Status.DisplayError(tSC)
        }

      }
    }
  }
  Catch ex {
    Set tSC=ex.AsStatus()
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
