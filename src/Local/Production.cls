Class Local.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Local.Production" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
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
  <Item Name="FTP_HL7_In" Category="" ClassName="EnsLib.HL7.Service.FTPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory">2.5.1</Setting>
    <Setting Target="Adapter" Name="FTPServer">sftp</Setting>
    <Setting Target="Adapter" Name="FTPPort">22</Setting>
    <Setting Target="Adapter" Name="SFTPAuthenticationMethods">k</Setting>
    <Setting Target="Adapter" Name="SFTPPassphraseCredentials">sftp_user</Setting>
    <Setting Target="Adapter" Name="SFTPPrivateKeyFile">/shared/key/iris_ssh_key</Setting>
    <Setting Target="Adapter" Name="SFTPPublicKeyFile">/shared/key/iris_ssh_key.pub</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Adapter" Name="Credentials"></Setting>
    <Setting Target="Adapter" Name="Protocol">SFTP</Setting>
    <Setting Target="Adapter" Name="FilePath">/upload</Setting>
    <Setting Target="Host" Name="TargetConfigNames">FromHL7ToAppointment</Setting>
  </Item>
  <Item Name="Local.BS.GetAppointmentBS" Category="" ClassName="Local.BS.GetAppointmentBS" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="Target">Local.BP.GetPatientData</Setting>
  </Item>
  <Item Name="FromHL7ToAppointment" Category="" ClassName="Local.BP.AppointmentBP" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Local.BP.GetPatientData" Category="" ClassName="Local.BP.GetPatientData" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
