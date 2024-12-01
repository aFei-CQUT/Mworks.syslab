model T1_1 "第五次作业第一题1小问"
  annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, 
  grid={2,2})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction(b={3},a={3, 6, 36}) 
    annotation (Placement(transformation(origin={-10,-26}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput y 
    annotation (Placement(transformation(origin={78,-26}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput y1 
    annotation (Placement(transformation(origin={-10,24}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Nonlinear.FixedDelay fixedDelay(delayTime=2) 
    annotation (Placement(transformation(origin={34,-26}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Step step 
    annotation (Placement(transformation(origin={-54,-26}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.ContinuousClock continuousClock 
    annotation (Placement(transformation(origin={-54,24}, 
extent={{-10,-10},{10,10}})));
equation
  connect(continuousClock.y, y1) 
  annotation(Line(origin={-3,24}, 
points={{-40,0},{-7,0}}, 
color={0,0,127}));
  connect(step.y, transferFunction.u) 
  annotation(Line(origin={-32,-26}, 
points={{-11,0},{10,0}}, 
color={0,0,127}));
  connect(transferFunction.y, fixedDelay.u) 
  annotation(Line(origin={12,-26}, 
points={{-11,0},{10,0}}, 
color={0,0,127}));
  connect(fixedDelay.y, y) 
  annotation(Line(origin={62,-26}, 
points={{-17,0},{16,0}}, 
color={0,0,127}));

end T1_1;