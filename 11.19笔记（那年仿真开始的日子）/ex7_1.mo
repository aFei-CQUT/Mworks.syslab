model ex7_1 "ppt23页的练习"
  Modelica.Blocks.Continuous.TransferFunction transferFunction 
    annotation (Placement(transformation(origin={-24,-18}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput y 
    annotation (Placement(transformation(origin={64,-18}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput y1 
    annotation (Placement(transformation(origin={-24,32}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Nonlinear.FixedDelay fixedDelay 
    annotation (Placement(transformation(origin={20,-18}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Step step 
    annotation (Placement(transformation(origin={-68,-18}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.ContinuousClock continuousClock 
    annotation (Placement(transformation(origin={-68,32}, 
extent={{-10,-10},{10,10}})));
equation
  connect(continuousClock.y, y1) 
  annotation(Line(origin={-17,32}, 
points={{-40,0},{-7,0}}, 
color={0,0,127}));
  connect(step.y, transferFunction.u) 
  annotation(Line(origin={-46,-18}, 
points={{-11,0},{10,0}}, 
color={0,0,127}));
  connect(transferFunction.y, fixedDelay.u) 
  annotation(Line(origin={-2,-18}, 
points={{-11,0},{10,0}}, 
color={0,0,127}));
  connect(fixedDelay.y, y) 
  annotation(Line(origin={48,-18}, 
points={{-17,0},{16,0}}, 
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));

end ex7_1;