Class Local.BS.GenericBS Extends Ens.BusinessService
{

Property Target As Ens.DataType.ConfigName;

Parameter SETTINGS = "Target:Basic";

Parameter ADAPTER = "Ens.InboundAdapter";

Method OnProcessInput(pRequest As %RegisteredObject, pResponse As %RegisteredObject) As %Status
{
    set tSC = $$$OK

    if ($CLASSNAME(pRequest) = "Local.Message.PatientInfoRequest"){
        set tSC=..SendRequestAsync(..Target, pRequest)
    }            

    Quit tSC
}

}
