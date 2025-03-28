Class Local.DT.S12ToAppointment Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Message, Local.Object.Appointment) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='Local.Object.Appointment' sourceDocType='2.5.1:SIU_S12' create='new' language='objectscript' >
<assign value='source.{PIDgrp(1).PID:PatientIdentifierList(2).IDNumber}' property='target.PatientId' action='set' />
<assign value='source.{PIDgrp().PID:PatientIdentifierList().AssigningAuthority.NamespaceID}' property='target.Facility' action='set' />
<assign value='$ZDATEH(..SubString(source.{SCH:AppointmentTimingQuantity().StartDateTime.Time},1,8),8)' property='target.AppointmentDate' action='set' />
</transform>
}

}
