model ex5
  Modelica.Blocks.Continuous.TransferFunction transferFunction(b={1, 2},a={1, 2, 3}) 
    annotation (Placement(transformation(origin={-27,-20}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Step step 
    annotation (Placement(transformation(origin={-88,-20}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.ContinuousClock continuousClock 
    annotation (Placement(transformation(origin={-88,52}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Nonlinear.FixedDelay fixedDelay(delayTime=1.0) 
    annotation (Placement(transformation(origin={34,-20}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput sysout 
    annotation (Placement(transformation(origin={84,-44}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput timeout 
    annotation (Placement(transformation(origin={-34,52}, 
extent={{-10,-10},{10,10}})));
  SyslabWorkspace.ToWorkspace.ToWorkspace_Scale toWorkspace_Scale 
    annotation (Placement(transformation(origin={84,6}, 
extent={{-10,-10},{10,10}})));
  annotation(experiment(Algorithm=Lsode,InlineIntegrator=false,InlineStepSize=false,NumberOfIntervals=1000,StartTime=0,StopTime=1,Tolerance=0.0001));
equation
  connect(step.y, transferFunction.u) 
  annotation(Line(origin={-58,-20}, 
points={{-19,0},{19,0}}, 
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(transferFunction.y, fixedDelay.u) 
  annotation(Line(origin={3,-20}, 
points={{-19,0},{19,0}}, 
color={0,0,127}));
  connect(continuousClock.y, timeout) 
  annotation(Line(origin={-55,52}, 
points={{-22,0},{21,0}}, 
color={0,0,127}));
  connect(fixedDelay.y, toWorkspace_Scale.dataInput) 
  annotation(Line(origin={53,-1}, 
points={{-8,-19},{5,-19},{5,7},{20,7}}, 
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(fixedDelay.y, sysout) 
  annotation(Line(origin={59,-35}, 
points={{-14,15},{-1,15},{-1,-9},{25,-9}}, 
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));

end ex5;