model ex7_2 "ppt23页的练习"
  Modelica.Blocks.Interfaces.RealOutput y 
    annotation (Placement(transformation(origin={-32,22}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Continuous.PID PID1 
    annotation (Placement(transformation(origin={-16,-32}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Feedback feedback 
    annotation (Placement(transformation(origin={-50,-32}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Step step 
    annotation (Placement(transformation(origin={-84,-32}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.ContinuousClock continuousClock 
    annotation (Placement(transformation(origin={-84,22}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction 
    annotation (Placement(transformation(origin={18,-32}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Nonlinear.FixedDelay fixedDelay 
    annotation (Placement(transformation(origin={52,-32}, 
extent={{-10,-10},{10,10}})));
  SyslabWorkspace.ToWorkspace.ToWorkspace_Scale toWorkspace_Scale 
    annotation (Placement(transformation(origin={84,-2}, 
extent={{-10,-10},{10,10}})));
equation
  connect(step.y, feedback.u1) 
  annotation(Line(origin={-62,-32}, 
points={{-11,0},{4,0}}, 
color={0,0,127}));
  connect(feedback.y, PID1.u) 
  annotation(Line(origin={-20,-32}, 
points={{-21,0},{-8,0}}, 
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(PID1.y, transferFunction.u) 
  annotation(Line(origin={0,-32}, 
points={{-5,0},{6,0}}, 
color={0,0,127}));
  connect(y, continuousClock.y) 
  annotation(Line(origin={-52,22}, 
points={{20,0},{-21,0}}, 
color={0,0,127}));
  connect(transferFunction.y, fixedDelay.u) 
  annotation(Line(origin={35,-32}, 
points={{-6,0},{5,0}}, 
color={0,0,127}));
  connect(fixedDelay.y, feedback.u2) 
  annotation(Line(origin={16,-52}, 
points={{47,20},{72,20},{72,-20},{-66,-20},{-66,12}}, 
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(toWorkspace_Scale.dataInput, fixedDelay.y) 
  annotation(Line(origin={69,-16}, 
points={{4,14},{-3,14},{-3,-16},{-6,-16}}, 
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));

end ex7_2;