Class Local.DT.ORUTransform Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.5:ORU_R01' targetDocType='2.5:ORU_R01' create='existing' language='objectscript' >
<assign value='"INSULCLOUD"' property='target.{MSH:SendingApplication}' action='set' />
<assign value='"HIS"' property='target.{MSH:ReceivingApplication}' action='set' />
<assign value='"HUPLF"' property='target.{MSH:ReceivingFacility}' action='set' />
<assign value='"ORU"' property='target.{MSH:MessageType.MessageCode}' action='set' />
<assign value='"R01"' property='target.{MSH:MessageType.TriggerEvent}' action='set' />
<assign value='"ORU_R01"' property='target.{MSH:MessageType.MessageStructure}' action='set' />
</transform>
}

}
