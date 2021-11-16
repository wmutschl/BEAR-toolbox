classdef tFAVAR < matlab.unittest.TestCase
    
    methods(Test)
        
        function tNonFavar(tc)
            s = BEARsettings(7, 'ExcelFile', 'data.xlsx');
            favarExists = isprop(s, 'favar');
            tc.verifyFalse(favarExists)
            
            s = BEARsettings(4, 'ExcelFile', 'data.xlsx');
            favarExists = isprop(s, 'favar');
            tc.verifyFalse(favarExists)
        end
        
        function tFavarExists(tc)
            s = BEARsettings(1, 'ExcelFile', 'data.xlsx');
            tc.verifyClass(s.favar, 'bear.settings.FAVARsettings' )
            
            s = BEARsettings(2, 'ExcelFile', 'data.xlsx', 'prior', 21);
            tc.verifyClass(s.favar, 'bear.settings.VARtypeSpecificFAVARsettings' )
            s = BEARsettings(5, 'ExcelFile', 'data.xlsx','stvol', 1);
            tc.verifyClass(s.favar, 'bear.settings.VARtypeSpecificFAVARsettings' )
            s = BEARsettings(6, 'ExcelFile', 'data.xlsx');
            tc.verifyClass(s.favar, 'bear.settings.VARtypeSpecificFAVARsettings' )
        end
        
        function tPriorChange(tc)
            
            s = BEARsettings(2, 'ExcelFile', 'data.xlsx');
            s.prior = 61;
            tc.verifyClass(s.favar, 'bear.settings.NullFAVAR' ) 
            s.prior = 11;
            tc.verifyClass(s.favar, 'bear.settings.VARtypeSpecificFAVARsettings' ) 
            
        end
        
        function tStvolChange(tc)
            
            s = BEARsettings(5, 'ExcelFile', 'data.xlsx');
            s.stvol = 4;
            tc.verifyClass(s.favar, 'bear.settings.NullFAVAR' ) 
            s.stvol = 3;
            tc.verifyClass(s.favar, 'bear.settings.VARtypeSpecificFAVARsettings' ) 
            
        end
        
    end
    
end
