within ModelicaModels.FullWaveRectifiers;

model RLCBridgeRectifier
  Modelica.Electrical.Analog.Ideal.IdealDiode D1 annotation(
    Placement(visible = true, transformation(origin = {-38, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SineVoltage source(V = 120, freqHz = 60)  annotation(
    Placement(visible = true, transformation(origin = {-84, 16}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-84, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Ideal.IdealDiode D2 annotation(
    Placement(visible = true, transformation(origin = {-20, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Ideal.IdealDiode D3 annotation(
    Placement(visible = true, transformation(origin = {-60, 24}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor(C = 0.022, v(fixed = true, start = 0))  annotation(
    Placement(visible = true, transformation(origin = {38, 24}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Inductor inductor(L = 0.03, i(fixed = true, start = 0))  annotation(
    Placement(visible = true, transformation(origin = {0, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Ideal.IdealDiode D4 annotation(
    Placement(visible = true, transformation(origin = {-50, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor load annotation(
    Placement(visible = true, transformation(origin = {62, 24}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(capacitor.p, load.p) annotation(
    Line(points = {{38, 34}, {62, 34}}, color = {0, 0, 255}));
  connect(load.n, capacitor.n) annotation(
    Line(points = {{62, 14}, {38, 14}}, color = {0, 0, 255}));
  connect(D3.n, D1.p) annotation(
    Line(points = {{-60, 34}, {-48, 34}, {-48, 56}, {-48, 56}}, color = {0, 0, 255}));
  connect(source.p, D1.p) annotation(
    Line(points = {{-84, 26}, {-84, 56}, {-48, 56}}, color = {0, 0, 255}));
  connect(source.n, ground.p) annotation(
    Line(points = {{-84, 6}, {-84, -66}}, color = {0, 0, 255}));
  connect(capacitor.n, D4.p) annotation(
    Line(points = {{38, 14}, {38, 14}, {38, -30}, {-60, -30}, {-60, -2}, {-60, -2}}, color = {0, 0, 255}));
  connect(ground.p, D2.p) annotation(
    Line(points = {{-84, -66}, {-30, -66}, {-30, -2}, {-30, -2}}, color = {0, 0, 255}));
  connect(D3.p, D4.p) annotation(
    Line(points = {{-60, 14}, {-60, 14}, {-60, -2}, {-60, -2}}, color = {0, 0, 255}));
  connect(D4.n, D2.p) annotation(
    Line(points = {{-40, -2}, {-30, -2}, {-30, -2}, {-30, -2}}, color = {0, 0, 255}));
  connect(inductor.n, capacitor.p) annotation(
    Line(points = {{10, 34}, {38, 34}}, color = {0, 0, 255}));
  connect(D2.n, inductor.p) annotation(
    Line(points = {{-10, -2}, {-10, 34}}, color = {0, 0, 255}));
  connect(D1.n, inductor.p) annotation(
    Line(points = {{-28, 56}, {-10, 56}, {-10, 34}, {-10, 34}}, color = {0, 0, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end RLCBridgeRectifier;