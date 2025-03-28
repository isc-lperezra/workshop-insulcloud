/// 
Class Local.BP.GetPatientData Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Local.Message.PatientInfoRequest' response='Ens.Response' height='2000' width='2000' >
<sequence xend='200' yend='250' >
<trace name='Test' value='"Message received"' xpos='548' ypos='185' />
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
