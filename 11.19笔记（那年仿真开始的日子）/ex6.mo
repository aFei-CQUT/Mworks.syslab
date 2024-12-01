model ex6
  Modelica.Blocks.Continuous.PID PID1(k=0.5,Ti=0.5,Td=1,Nd=10) 
    annotation (Placement(transformation(origin={-16,-14}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction(b={1, 2},a={1, 2, 3}) 
    annotation (Placement(transformation(origin={14,-14}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Feedback feedback 
    annotation (Placement(transformation(origin={-46,-14}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.ContinuousClock continuousClock 
    annotation (Placement(transformation(origin={-76,34}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Step step 
    annotation (Placement(transformation(origin={-76,-14}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Nonlinear.FixedDelay fixedDelay(delayTime=1.0) 
    annotation (Placement(transformation(origin={44,-14}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput y 
    annotation (Placement(transformation(origin={-42,34}, 
extent={{-10,-10},{10,10}})));
  SyslabWorkspace.ToWorkspace.ToWorkspace_Scale toWorkspace_Scale 
    annotation (Placement(transformation(origin={84,2}, 
extent={{-10,-10},{10,10}})));
  annotation(experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,NumberOfIntervals=1000,StartTime=0,StopTime=10,Tolerance=0.0001),__MWORKS(ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=10,ContinueTimeVector)));
equation
  connect(step.y, feedback.u1) 
  annotation(Line(origin={-57,-14}, 
points={{-8,0},{3,0}}, 
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(feedback.y, PID1.u) 
  annotation(Line(origin={-26,-14}, 
points={{-11,0},{-2,0}}, 
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(PID1.y, transferFunction.u) 
  annotation(Line(origin={11,-14}, 
points={{-16,0},{-9,0}}, 
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(transferFunction.y, fixedDelay.u) 
  annotation(Line(origin={49,-14}, 
points={{-24,0},{-17,0}}, 
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(fixedDelay.y, feedback.u2) 
  annotation(Line(origin={24,-33}, 
points={{31,19},{66,19},{66,-19},{-70,-19},{-70,11}}, 
color={0,0,127}));
  connect(continuousClock.y, y) 
  annotation(Line(origin={-53,34}, 
points={{-12,0},{11,0}}, 
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(toWorkspace_Scale.dataInput, fixedDelay.y) 
  annotation(Line(origin={89,1}, 
points={{-16,1},{-31,1},{-31,-15},{-34,-15}}, 
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));

end ex6;