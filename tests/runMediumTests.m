import matlab.unittest.TestSuite
clear; clc;
cd(fileparts(mfilename('fullpath')));
suite = TestSuite.fromFile('replicationTests.m','Tag','MediumReplications');
suite.run()