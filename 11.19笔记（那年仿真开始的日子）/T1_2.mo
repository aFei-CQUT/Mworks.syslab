model T1_2 "第五次作业第二题2小问"
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, 
    grid = {2, 2})));
  Modelica.Blocks.Interfaces.RealOutput y 
    annotation(Placement(transformation(origin = {-30, 30}, 
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.PID PID1(k = 20, Td = 20, Ti = 5) 
    annotation(Placement(transformation(origin = {-14, -24}, 
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Feedback feedback 
    annotation(Placement(transformation(origin = {-48, -24}, 
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Step step 
    annotation(Placement(transformation(origin = {-82, -24}, 
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.ContinuousClock continuousClock 
    annotation(Placement(transformation(origin = {-82, 30}, 
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction(b = {3}, a = {3, 6, 36}) 
    annotation(Placement(transformation(origin = {20, -24}, 
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Nonlinear.FixedDelay fixedDelay(delayTime = 2) 
    annotation(Placement(transformation(origin = {54, -24}, 
    extent = {{-10, -10}, {10, 10}})));
  SyslabWorkspace.ToWorkspace.ToWorkspace_Scale toWorkspace_Scale(period = 0.01) 
    annotation(Placement(transformation(origin = {86, 6}, 
    extent = {{-10, -10}, {10, 10}})));
equation
  connect(step.y, feedback.u1) 
    annotation(Line(origin = {-60, -24}, 
    points = {{-11, 0}, {4, 0}}, 
    color = {0, 0, 127}));
  connect(feedback.y, PID1.u) 
    annotation(Line(origin = {-18, -24}, 
    points = {{-21, 0}, {-8, 0}}, 
    color = {0, 0, 127}));
  connect(PID1.y, transferFunction.u) 
    annotation(Line(origin = {2, -24}, 
    points = {{-5, 0}, {6, 0}}, 
    color = {0, 0, 127}));
  connect(y, continuousClock.y) 
    annotation(Line(origin = {-50, 30}, 
    points = {{20, 0}, {-21, 0}}, 
    color = {0, 0, 127}));
  connect(transferFunction.y, fixedDelay.u) 
    annotation(Line(origin = {37, -24}, 
    points = {{-6, 0}, {5, 0}}, 
    color = {0, 0, 127}));
  connect(fixedDelay.y, feedback.u2) 
    annotation(Line(origin = {18, -44}, 
    points = {{47, 20}, {72, 20}, {72, -20}, {-66, -20}, {-66, 12}}, 
    color = {0, 0, 127}));
  connect(toWorkspace_Scale.dataInput, fixedDelay.y) 
    annotation(Line(origin = {71, -8}, 
    points = {{4, 14}, {-3, 14}, {-3, -16}, {-6, -16}}, 
    color = {0, 0, 127}), __MWORKS(BlockSystem(NamedSignal)));

end T1_2;