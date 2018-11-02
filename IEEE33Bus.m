
base_mva = 100000;
%       P+jQ
Sl = [ 
        0+0j;        
        100+60j;    
        90+40j;    
        120+80j;    
        60+30j;    
        60+20j;    
        200+100j;    
        200+100j;    
        60+20j;    
        60+20j;    
        45+30j;    
        60+35j;    
        60+35j;    
        120+80j;    
        60+10j;    
        60+20j;    
        60+20j;    
        90+40j;    
        90+40j;    
        90+40j;    
        90+40j;    
        90+40j;    
        90+50j;    
        420+200j;    
        420+200j;    
        60+25j;    
        60+25j;    
        60+20j;    
        120+70j;    
        200+600j;    
        150+70j;    
        210+100j;    
        60+40j    ];
    
%Converting the Power to its p.u value
Sl = (Sl/base_mva);                          
Sl = Sl;
%To add interconnections, append the Z_branch matrix with a new row with
%the in bus, out bus, and impedance values of the connection. The
%interconnection must be added at the end of the matrix for the program to
%run correctly. Similarly, a new row should be added to I_branch matrix
%with the in bus, out bus and initial branch current set as 0. The index of
%the new row should be the same in both matrices

% inbus outbus              R   +   jX
Z_branch = [ 
            1,     2,     0.0922+ 0.0477j;    
            2,     3,     0.493 + 0.2511j;    
            3,     4,     0.366 + 0.1864j;    
            4,     5,     0.3811+ 0.1941j;    
            5,     6,     0.819 + 0.707j;    
            6,     7,     0.1872+ 0.6188j;    
            7,     8,     1.7114+ 1.2351j;    
            8,     9,     1.03  + 0.74j;    
            9,     10,    1.04  + 0.74j;    
            10,    11,    0.1966+ 0.065j;    
            11,    12,    0.3744+ 0.1238j;    
            12,    13,    1.468 + 1.155j;    
            13,    14,    0.5416+ 0.7129j;    
            14,    15,    0.591 + 0.526j;    
            15,    16,    0.7463+ 0.545j;    
            16,    17,    1.289 + 1.721j;    
            17,    18,    0.732+0.574j;    
            2 ,    19,    0.164+0.1565j;    
            19,    20,    1.5042+1.3554j;    
            20,    21,    0.4095+0.4784j;    
            21,    22,    0.7089+0.9373j;    
            3,     23,    0.4512+0.3083j;    
            23,    24,    0.898+0.7091j;    
            24,    25,    0.896+0.7011j;    
            6,     26,    0.203+0.1034j;    
            26,    27,    0.2842+0.1447j;    
            27,    28,    1.059+0.9337j;    
            28,    29,    0.8042+0.7006j;    
            29,    30,    0.5075+0.2585j;    
            30,    31,    0.9744+0.963j;    
            31,    32,    0.3105+0.3619j;    
            32,    33,    0.341+0.5302j;];
            %8,     21,    2+2j;
            %9,     15,    2+2j;
            %12,    22,    2+2j;
            %18,    33,    0.5+0.5j;
            %25,    29,    0.5+0.5j];

%Converting the Impedence to its p.u value
Z_branch(:,3) = (Z_branch(:,3)/1.69);              

% inbus outbus Iio
I_branch = [       1	2	0;	
                   2    3	0;
                   3	4	0;
                   4	5	0;
                   5	6	0;
                   6	7	0;
                   7	8	0;
                   8	9	0;
                   9	10	0;
                   10	11	0;
                   11	12	0;
                   12	13	0;
                   13	14	0;
                   14	15	0;
                   15	16	0;
                   16	17	0;
                   17	18	0;
                    2	19	0;
                   19	20	0;
                   20	21	0;
                   21	22	0;
                    3	23	0;
                   23	24	0;
                   24	25	0;
                   6	26	0;
                   26	27	0;
                   27	28	0;
                   28	29	0;
                   29	30	0;
                   30	31	0;
                   31	32	0;
                   32	33	0;];
                   %8    21  0;
                   %9    15  0;
                   %12   22  0;
                   %18   33  0;
                   %25   29  0;];