/// 
Class Local.BP.GetPatientData Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Local.Message.PatientInfoRequest' response='Local.Message.PatientInfoResponse' height='2000' width='2000' >
<sequence xend='200' yend='450' >
<call name='Get JWT Token' target='Local.BO.GetTokenInsulcloud' async='0' xpos='200' ypos='250' >
<request type='Local.Message.PatientInfoRequest' >
<assign property="callrequest" value="request" action="set" languageOverride="" />
</request>
<response type='Local.Message.PatientInfoResponse' >
<assign property="request.Token" value="callresponse.Token" action="set" languageOverride="" />
</response>
</call>
<call name='Get Patient Info' target='Local.BO.GetPatientInfo' async='0' xpos='200' ypos='350' >
<request type='Local.Message.PatientInfoRequest' >
<assign property="callrequest" value="request" action="set" languageOverride="" />
</request>
<response type='Local.Message.PatientInfoResponse' >
<assign property="response" value="callresponse" action="set" languageOverride="" />
</response>
</call>
</sequence>
</process>
}

}
