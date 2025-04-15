%:- use_module('shape_workaround').
:- use_module(library(util/suturo_test)).
:- use_module(library(lang/rdf_tests), [begin_rdf_tests/2, end_rdf_tests/1]).

:- use_module(library(model/object/object_creation), [create_object/4]).

:- begin_rdf_tests(gpsr_tests,
                   'package://suturo_knowledge/owl/suturo.owl',
                   [ namespace('http://www.ease-crc.org/ont/SUTURO-test.owl#')]).

test(light_or_heavy) :-
    is_light_or_heavy('metal bowl', heavy).

test(object_position) :-
    Frame = map,
    FPosition = [-6.14,-1.12,4.31],
    create_object(Obj, test:obj, [Frame, FPosition, [0,0,0,1]]),
    object_pose(Obj, [Frame, QPosition, _Rotation]),
    assert_equals(FPosition, QPosition).

%% test('create_and_ask', [setup(test_setup), cleanup(test_cleanup)]) :-
%%     Shape = box(2.0,3.0,4.0),
%%     create_object(Obj, test:obj, [map, [0,0,0], [0,0,0,1]], [shape(Shape)]),
%%     object_shape_workaround(Obj, _Frame, ShapeTerm, _Pose, _Material),
%%     assert_equals(Shape, ShapeTerm).

:- end_rdf_tests(gpsr_tests).
