// MCA_fn_getObjectDimensions.sqf.

params ["_object"];

private ["_bbr", "_p1", "_p2"];
_bbr = boundingBoxReal _object;
_p1 = _bbr select 0;
_p2 = _bbr select 1;

private ["_w", "_l", "_h"];
_w = abs ((_p2 select 0) - (_p1 select 0));
_l = abs ((_p2 select 1) - (_p1 select 1));
_h = abs ((_p2 select 2) - (_p1 select 2));

private ["_result"];
result = [_w, _l, _h];
result
