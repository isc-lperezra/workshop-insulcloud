/// 
Class Local.BP.AppointmentBP Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.HL7.Message' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='patientAppointment' type='Local.Object.Appointment' instantiate='0' />
</context>
<sequence xend='200' yend='350' >
<transform name='Get appointment' class='Local.DT.S12ToAppointment' source='request' target='context.patientAppointment' xpos='200' ypos='250' />
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
