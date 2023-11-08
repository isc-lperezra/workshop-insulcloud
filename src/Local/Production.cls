Class Local.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Local.Production" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Local.BS.FirebaseBS" Category="" ClassName="Local.BS.FirebaseBS" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="DocName">data_poc</Setting>
    <Setting Target="Adapter" Name="KeyPath">/shared/key/firebase-key.json</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="EnsLib.File.PassthroughService" Category="" ClassName="EnsLib.File.PassthroughService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">Local.BP.FromPdfToORU</Setting>
    <Setting Target="Adapter" Name="FilePath">/shared/hospital/</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.pdf</Setting>
  </Item>
  <Item Name="Local.BP.FromPdfToORU" Category="" ClassName="Local.BP.FromPdfToORU" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="EnsLib.HL7.Operation.FileOperation" Category="" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Filename">%f_%Q%!+(_a).hl7</Setting>
    <Setting Target="Adapter" Name="FilePath">/shared/out/</Setting>
  </Item>
</Production>
}

}
