/// 
Class Local.BP.FromPdfToORU Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='%Stream.Object' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='messageORU' type='EnsLib.HL7.Message' instantiate='1' />
</context>
<sequence xend='200' yend='450' >
<code name='PDF to Base64 in HL7' xpos='200' ypos='250' >
<![CDATA[ Set context.messageORU = ##class(EnsLib.HL7.Message).%New()
 Do context.messageORU.PokeDocType("2.5.1:ORU_R01")
 Set status = context.messageORU.StoreFieldStreamBase64(request,"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue(1)")
 do context.messageORU.SetValueAt("DOC^Application^PDF^Base64^" _ context.messageORU.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue(1)"),"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue(1)")
]]>
</code>
<call name='Call BO to save hl7 file' target='EnsLib.HL7.Operation.FileOperation' async='1' xpos='200' ypos='350' >
<request type='EnsLib.HL7.Message' >
<assign property="callrequest" value="context.messageORU" action="set" />
</request>
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
