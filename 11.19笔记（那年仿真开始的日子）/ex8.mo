model ex8 "FunctionAPI的尝试"
  SyslabWorkspace.FunctionAPI.SyslabGlobalConfig syslabGlobalConfig 
    annotation (Placement(transformation(origin={-84,84}, 
extent={{-10,-10},{10,10}})));
  ImportedTypes.SyslabFunction1 syslabFunction1_1 
    annotation (Placement(transformation(origin={54,8}, 
extent={{-10,-10},{10,10}})));
  package ImportedTypes
    model SyslabFunction1 
      "julia function"
      annotation (__MWorks(SyslabFunction(Type = "function",AllFuncNames="func",Duplicated=true,BlockPort(in_u(Scope=Input,Type=0,Dims={-1},Value=1,Desc=""),out_y(Scope=Output,Type=0,Dims={-1},Value=1,Desc="")))), 
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
          grid = {2.0, 2.0})), 
        Icon(coordinateSystem(extent={{-100,-100},{100,100}}, 
grid={2,2}),graphics = {Bitmap(origin={0,0}, 
extent={{-100,-100},{100,100}}, 
fileName="Modelica://SyslabWorkspace/Resources/Images/NewFunctionAPI.svg"), Text(origin={0,130}, 
lineColor={0,0,255}, 
extent={{-150,20},{150,-20}}, 
textString="%name", 
textColor={0,0,255}), Text(origin={-120,20}, 
lineColor={128,128,128}, 
extent={{0,0},{0,10}}, 
textString="u", 
fontSize=10, 
textColor={128,128,128}, 
horizontalAlignment=TextAlignment.Right), Text(origin={120,20}, 
lineColor={128,128,128}, 
extent={{0,0},{0,10}}, 
textString="y", 
fontSize=10, 
textColor={128,128,128}, 
horizontalAlignment=TextAlignment.Left)}));

      import Modelica;
      import SyslabWorkspace.Communication;
      extends SyslabWorkspace.Communication.SyslabSampleBase;

      Communication.SyslabFunctionBase base(funcName="func", scriptText = "base64=dXNpbmcgVHlHbG9iYWxPcHRpbWl6YXRpb24KIyDkvb/nlKggVHlHbG9iYWxPcHRpbWl6YXRpb24g5YaF6YOo5bqT5Lit55qEIHBhcnRpY2xlc3dhcm0g5Ye95pWw5a6e546w57KS5a2Q576k566X5rOVCgpmdW5jdGlvbiBmdW5jKHUpCiAgICB5ID0gdQogICAgcmV0dXJuIHkKZW5kCg==", startTime = startTime, period = period,inputDims={{-1}},inputTypes={0},outputDims={{-1}},outputTypes={0},hasInput=true,hasOutput=true) 
        annotation (Placement(transformation(extent = {{-10.0, -10.0}, {10.0, 10.0}},origin={0.0, 0.0})));
      Modelica.Blocks.Interfaces.RealInput in_u 
      annotation(Placement(transformation(origin={-110,0}, 
      extent={{-10.0,-10.0},{10.0,10.0}})));
      ArrayConverter._A2V_1D_Real in_u_converter(dims = {1}) 
      annotation(HideResult=true,Placement(transformation(origin={-80,0}, 
      extent={{-10.0,-10.0},{10.0,10.0}})));
      Modelica.Blocks.Interfaces.RealOutput out_y 
      annotation(Placement(transformation(origin={110,0}, 
      extent={{-10.0,-10.0},{10.0,10.0}})));
      ArrayConverter._V2A_1D_Real out_y_converter(dims = {1}) 
      annotation(HideResult=true,Placement(transformation(origin={80,0}, 
      extent={{-10.0,-10.0},{10.0,10.0}})));
      equation
      connect(in_u, in_u_converter.u[1]) 
      annotation (Line(origin = {-95, 0}, 
              points = {{-15, 0}, {0, 0}, {0, 0}, {15, 0}}, 
              color = {255, 127, 0}));
      connect(in_u_converter.y[1], base.inputs[1]) 
      annotation (Line(origin = {-44, 32}, 
              points = {{-36, -32}, {0, -32}, {0, 33}, {36, 33}}, 
              color = {255, 127, 0}));
      connect(out_y, out_y_converter.y[1]) 
      annotation (Line(origin = {95, 0}, 
              points = {{15, 0}, {0, 0}, {0, 0}, {-15, 0}}, 
              color = {255, 127, 0}));
      connect(out_y_converter.u[1], base.outputs[1]) 
      annotation (Line(origin = {36, 32}, 
              points = {{44, -32}, {0, -32}, {0, 33}, {-44, 33}}, 
              color = {255, 127, 0}));
      end SyslabFunction1;
    package ArrayConverter
      model _A2V_1D_Real 
      "1 dimension Real array to Real vector"
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}},preserveAspectRatio=false,grid={2.0,2.0})), 
                          Icon(coordinateSystem(preserveAspectRatio = false, extent = { {-100, -100}, {100, 100} }), graphics = {
                            Rectangle(
                            lineColor = {200, 200, 200}, 
                            fillColor = {248, 248, 248}, 
                            fillPattern = FillPattern.HorizontalCylinder, 
                            extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
                            radius = 25.0), 
                            Rectangle(
                            lineColor = {128, 128, 128}, 
                            extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
                            radius = 25.0), Polygon(origin = {20.0, 0.0}, 
                            lineColor = {64, 64, 64}, 
                            fillColor = {255, 255, 255}, 
                            fillPattern = FillPattern.Solid, 
                            points = {{-10.0, 70.0}, {10.0, 70.0}, {40.0, 20.0}, {80.0, 20.0}, {80.0, -20.0}, {40.0, -20.0}, {10.0, -70.0}, {-10.0, -70.0}}), 
                            Polygon(fillColor = {102, 102, 102}, 
                            pattern = LinePattern.None, 
                            fillPattern = FillPattern.Solid, 
                            points = {{-100.0, 20.0}, {-60.0, 20.0}, {-30.0, 70.0}, {-10.0, 70.0}, {-10.0, -70.0}, {-30.0, -70.0}, {-60.0, -20.0}, {-100.0, -20.0}}) }));
        import Modelica;
        parameter Integer dims[1] = {2};
        Modelica.Blocks.Interfaces.RealInput u[dims[1]] 
          annotation(Placement(transformation(origin ={-120.0,0.0},extent ={{-20.0,-20.0}, {20.0, 20.0}})));
        Modelica.Blocks.Interfaces.RealOutput y[product(dims)] 
          annotation(Placement(transformation(origin={110.0,0.0},extent={{-10.0,-10.0},{10.0,10.0}})));
      protected
        Integer pos;
      algorithm
        pos := 1;
        for i1 in 1:dims[1] loop
          y[pos] := u[i1];
          pos := pos + 1;
        end for;
      end _A2V_1D_Real;
      model _V2A_1D_Real 
      "Real vector to 1 dimension Real array"
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}},preserveAspectRatio=false,grid={2.0,2.0})), 
                          Icon(coordinateSystem(preserveAspectRatio = false, extent = { {-100, -100}, {100, 100} }), graphics = {
                            Rectangle(
                            lineColor = {200, 200, 200}, 
                            fillColor = {248, 248, 248}, 
                            fillPattern = FillPattern.HorizontalCylinder, 
                            extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
                            radius = 25.0), 
                            Rectangle(
                            lineColor = {128, 128, 128}, 
                            extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
                            radius = 25.0), Polygon(origin = {20.0, 0.0}, 
                            lineColor = {64, 64, 64}, 
                            fillColor = {255, 255, 255}, 
                            fillPattern = FillPattern.Solid, 
                            points = {{-10.0, 70.0}, {10.0, 70.0}, {40.0, 20.0}, {80.0, 20.0}, {80.0, -20.0}, {40.0, -20.0}, {10.0, -70.0}, {-10.0, -70.0}}), 
                            Polygon(fillColor = {102, 102, 102}, 
                            pattern = LinePattern.None, 
                            fillPattern = FillPattern.Solid, 
                            points = {{-100.0, 20.0}, {-60.0, 20.0}, {-30.0, 70.0}, {-10.0, 70.0}, {-10.0, -70.0}, {-30.0, -70.0}, {-60.0, -20.0}, {-100.0, -20.0}}) }));
        import Modelica;
        parameter Integer dims[1] = {2};
        Modelica.Blocks.Interfaces.RealInput u[product(dims)] 
        annotation(Placement(transformation(origin ={-120.0,0.0},extent ={{-20.0,-20.0}, {20.0, 20.0}})));
        Modelica.Blocks.Interfaces.RealOutput y[dims[1]] 
        annotation(Placement(transformation(origin={110.0,0.0},extent={{-10.0,-10.0},{10.0,10.0}})));
      protected
        Integer pos;
      algorithm
        pos := 1;
        for i1 in 1:dims[1] loop
          y[i1] := u[pos];
          pos := pos + 1;
        end for;
      end _V2A_1D_Real;

    end ArrayConverter;

  end ImportedTypes;

end ex8;