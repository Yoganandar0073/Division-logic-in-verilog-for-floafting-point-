
module DIv (clock, rst, numerator, denom, div );
	input clock , rst ;
	input [63:0] numerator, denom;
	output reg [63:0] div;
	reg [63:0] one_by_x [256:0]; 
	reg [127:0] a_div;
	wire [127:0] t;
	wire [63:0] h , t2;
	wire [7:0] t1; 
	reg [7:0] n ; 
	reg [63:0]  numerator1, sum1,sum2;
	reg [7:0] n1 ; 
	reg [8:0] lut_index ;
	always @(posedge clock)
	begin
		if (rst==1'b0)
		begin
			
			a_div <= 128'b0;
			numerator1 <= 64'b0;			
			lut_index <= 8'b0;
			div <= 64'b0;
		    n <= 8'd0 ; 
			one_by_x[0  ] <=  64'h0000000000000000  ;
			one_by_x[1  ] <=  64'hffffffffffffffff  ;
			one_by_x[2  ] <=  64'h7fffffffffffffff  ;
			one_by_x[3  ] <=  64'h55554f7fffffffff  ;
			one_by_x[4  ] <=  64'h3fffffffffffffff  ;
			one_by_x[5  ] <=  64'h3333333fffffffff  ;
			one_by_x[6  ] <=  64'h2aaab03fffffffff  ;
			one_by_x[7  ] <=  64'h249246bfffffffff  ;
			one_by_x[8  ] <=  64'h1fffffffffffffff  ;
			one_by_x[9  ] <=  64'h1c71c53fffffffff  ;
			one_by_x[10 ] <=  64'h1999999fffffffff  ;
			one_by_x[11 ] <=  64'h1745cfdfffffffff  ;
			one_by_x[12 ] <=  64'h15554fbfffffffff  ;
			one_by_x[13 ] <=  64'h13b139bfffffffff  ;
			one_by_x[14 ] <=  64'h12492bbfffffffff  ;
			one_by_x[15 ] <=  64'h1111169fffffffff  ;
			one_by_x[16 ] <=  64'h0fffffffffffffff  ;
			one_by_x[17 ] <=  64'h0f0f16efffffffff  ;
			one_by_x[18 ] <=  64'h0e38eaffffffffff  ;
			one_by_x[19 ] <=  64'h0d794a6fffffffff  ;
			one_by_x[20 ] <=  64'h0ccccccfffffffff  ;
			one_by_x[21 ] <=  64'h0c30c23fffffffff  ;
			one_by_x[22 ] <=  64'h0ba2f05fffffffff  ;
			one_by_x[23 ] <=  64'h0b215fcfffffffff  ;
			one_by_x[24 ] <=  64'h0aaab03fffffffff  ;
			one_by_x[25 ] <=  64'h0a3d709fffffffff  ;
			one_by_x[26 ] <=  64'h09d8a54fffffffff  ;
			one_by_x[27 ] <=  64'h097b41bfffffffff  ;
			one_by_x[28 ] <=  64'h09248d7fffffffff  ;
			one_by_x[29 ] <=  64'h08d3e0bfffffffff  ;
			one_by_x[30 ] <=  64'h088882efffffffff  ;
			one_by_x[31 ] <=  64'h08420f6fffffffff  ;
			one_by_x[32 ] <=  64'h07ffffffffffffff  ;
			one_by_x[33 ] <=  64'h07c1eff7ffffffff  ;
			one_by_x[34 ] <=  64'h07878b77ffffffff  ;
			one_by_x[35 ] <=  64'h07506dd7ffffffff  ;
			one_by_x[36 ] <=  64'h071c757fffffffff  ;
			one_by_x[37 ] <=  64'h06eb3dcfffffffff  ;
			one_by_x[38 ] <=  64'h06bca537ffffffff  ;
			one_by_x[39 ] <=  64'h06906897ffffffff  ;
			one_by_x[40 ] <=  64'h06666667ffffffff  ;
			one_by_x[41 ] <=  64'h063e6c4fffffffff  ;
			one_by_x[42 ] <=  64'h0618697fffffffff  ;
			one_by_x[43 ] <=  64'h05f41aefffffffff  ;
			one_by_x[44 ] <=  64'h05d16fc7ffffffff  ;
			one_by_x[45 ] <=  64'h05b05747ffffffff  ;
			one_by_x[46 ] <=  64'h0590afe7ffffffff  ;
			one_by_x[47 ] <=  64'h057268cfffffffff  ;
			one_by_x[48 ] <=  64'h05554fbfffffffff  ;
			one_by_x[49 ] <=  64'h0539756fffffffff  ;
			one_by_x[50 ] <=  64'h051eb84fffffffff  ;
			one_by_x[51 ] <=  64'h050507a7ffffffff  ;
			one_by_x[52 ] <=  64'h04ec52a7ffffffff  ;
			one_by_x[53 ] <=  64'h04d4887fffffffff  ;
			one_by_x[54 ] <=  64'h04bda93fffffffff  ;
			one_by_x[55 ] <=  64'h04a79357ffffffff  ;
			one_by_x[56 ] <=  64'h049246bfffffffff  ;
			one_by_x[57 ] <=  64'h047dc377ffffffff  ;
			one_by_x[58 ] <=  64'h0469e7f7ffffffff  ;
			one_by_x[59 ] <=  64'h0456c507ffffffff  ;
			one_by_x[60 ] <=  64'h044449d7ffffffff  ;
			one_by_x[61 ] <=  64'h043254e7ffffffff  ;
			one_by_x[62 ] <=  64'h042107b7ffffffff  ;
			one_by_x[63 ] <=  64'h041040bfffffffff  ;
			one_by_x[64 ] <=  64'h03ffffffffffffff  ;
			one_by_x[65 ] <=  64'h03f04577ffffffff  ;
			one_by_x[66 ] <=  64'h03e1005fffffffff  ;
			one_by_x[67 ] <=  64'h03d21ff3ffffffff  ;
			one_by_x[68 ] <=  64'h03c3c5bbffffffff  ;
			one_by_x[69 ] <=  64'h03b5d02fffffffff  ;
			one_by_x[70 ] <=  64'h03a83f4fffffffff  ;
			one_by_x[71 ] <=  64'h039b1317ffffffff  ;
			one_by_x[72 ] <=  64'h038e3abfffffffff  ;
			one_by_x[73 ] <=  64'h0381c713ffffffff  ;
			one_by_x[74 ] <=  64'h0375a74bffffffff  ;
			one_by_x[75 ] <=  64'h0369ca9fffffffff  ;
			one_by_x[76 ] <=  64'h035e529bffffffff  ;
			one_by_x[77 ] <=  64'h03531db3ffffffff  ;
			one_by_x[78 ] <=  64'h03483cafffffffff  ;
			one_by_x[79 ] <=  64'h033d8dffffffffff  ;
			one_by_x[80 ] <=  64'h03333333ffffffff  ;
			one_by_x[81 ] <=  64'h03291b83ffffffff  ;
			one_by_x[82 ] <=  64'h031f3627ffffffff  ;
			one_by_x[83 ] <=  64'h031593e3ffffffff  ;
			one_by_x[84 ] <=  64'h030c34bfffffffff  ;
			one_by_x[85 ] <=  64'h030307f3ffffffff  ;
			one_by_x[86 ] <=  64'h02fa0d77ffffffff  ;
			one_by_x[87 ] <=  64'h02f14553ffffffff  ;
			one_by_x[88 ] <=  64'h02e8c047ffffffff  ;
			one_by_x[89 ] <=  64'h02e05ccbffffffff  ;
			one_by_x[90 ] <=  64'h02d82ba3ffffffff  ;
			one_by_x[91 ] <=  64'h02d02cd3ffffffff  ;
			one_by_x[92 ] <=  64'h02c86057ffffffff  ;
			one_by_x[93 ] <=  64'h02c0b567ffffffff  ;
			one_by_x[94 ] <=  64'h02b92c07ffffffff  ;
			one_by_x[95 ] <=  64'h02b1d4f7ffffffff  ;
			one_by_x[96 ] <=  64'h02aab043ffffffff  ;
			one_by_x[97 ] <=  64'h02a39c4fffffffff  ;
			one_by_x[98 ] <=  64'h029cbab7ffffffff  ;
			one_by_x[99 ] <=  64'h0295faa7ffffffff  ;
			one_by_x[100] <=  64'h028f5c27ffffffff  ;
			one_by_x[101] <=  64'h0288df37ffffffff  ;
			one_by_x[102] <=  64'h028283d3ffffffff  ;
			one_by_x[103] <=  64'h027c49fbffffffff  ;
			one_by_x[104] <=  64'h027620efffffffff  ;
			one_by_x[105] <=  64'h02702a33ffffffff  ;
			one_by_x[106] <=  64'h026a443fffffffff  ;
			one_by_x[107] <=  64'h02647fdbffffffff  ;
			one_by_x[108] <=  64'h025ecc3fffffffff  ;
			one_by_x[109] <=  64'h02593a2bffffffff  ;
			one_by_x[110] <=  64'h0253c9abffffffff  ;
			one_by_x[111] <=  64'h024e69efffffffff  ;
			one_by_x[112] <=  64'h02492bc3ffffffff  ;
			one_by_x[113] <=  64'h0243fe5bffffffff  ;
			one_by_x[114] <=  64'h023ee1bbffffffff  ;
			one_by_x[115] <=  64'h0239e6abffffffff  ;
			one_by_x[116] <=  64'h0234fc5fffffffff  ;
			one_by_x[117] <=  64'h023022dbffffffff  ;
			one_by_x[118] <=  64'h022b6ae7ffffffff  ;
			one_by_x[119] <=  64'h0226b2f3ffffffff  ;
			one_by_x[120] <=  64'h02221c8bffffffff  ;
			one_by_x[121] <=  64'h021d96e7ffffffff  ;
			one_by_x[122] <=  64'h021932d7ffffffff  ;
			one_by_x[123] <=  64'h0214cec3ffffffff  ;
			one_by_x[124] <=  64'h02108c3fffffffff  ;
			one_by_x[125] <=  64'h020c49bbffffffff  ;
			one_by_x[126] <=  64'h020828c3ffffffff  ;
			one_by_x[127] <=  64'h020407cbffffffff  ;
			one_by_x[128] <=  64'h01fff79bffffffff  ;
			one_by_x[129] <=  64'h01fc08f9ffffffff  ;
			one_by_x[130] <=  64'h01f81a57ffffffff  ;
			one_by_x[131] <=  64'h01f44d43ffffffff  ;
			one_by_x[132] <=  64'h01f0802fffffffff  ;
			one_by_x[133] <=  64'h01ecc3e3ffffffff  ;
			one_by_x[134] <=  64'h01e9185bffffffff  ;
			one_by_x[135] <=  64'h01e56cd5ffffffff  ;
			one_by_x[136] <=  64'h01e1e2ddffffffff  ;
			one_by_x[137] <=  64'h01de58e5ffffffff  ;
			one_by_x[138] <=  64'h01dadfb5ffffffff  ;
			one_by_x[139] <=  64'h01d77749ffffffff  ;
			one_by_x[140] <=  64'h01d41fa7ffffffff  ;
			one_by_x[141] <=  64'h01d0c803ffffffff  ;
			one_by_x[142] <=  64'h01cd8127ffffffff  ;
			one_by_x[143] <=  64'h01ca4b11ffffffff  ;
			one_by_x[144] <=  64'h01c714fbffffffff  ;
			one_by_x[145] <=  64'h01c40075ffffffff  ;
			one_by_x[146] <=  64'h01c0db27ffffffff  ;
			one_by_x[147] <=  64'h01bdd765ffffffff  ;
			one_by_x[148] <=  64'h01bad3a5ffffffff  ;
			one_by_x[149] <=  64'h01b7cfe5ffffffff  ;
			one_by_x[150] <=  64'h01b4edb1ffffffff  ;
			one_by_x[151] <=  64'h01b20b7fffffffff  ;
			one_by_x[152] <=  64'h01af294dffffffff  ;
			one_by_x[153] <=  64'h01ac57e1ffffffff  ;
			one_by_x[154] <=  64'h01a9973dffffffff  ;
			one_by_x[155] <=  64'h01a6d697ffffffff  ;
			one_by_x[156] <=  64'h01a415f3ffffffff  ;
			one_by_x[157] <=  64'h01a16615ffffffff  ;
			one_by_x[158] <=  64'h019ec6ffffffffff  ;
			one_by_x[159] <=  64'h019c27e9ffffffff  ;
			one_by_x[160] <=  64'h01999999ffffffff  ;
			one_by_x[161] <=  64'h01970b49ffffffff  ;
			one_by_x[162] <=  64'h01948dc1ffffffff  ;
			one_by_x[163] <=  64'h01921037ffffffff  ;
			one_by_x[164] <=  64'h018fa375ffffffff  ;
			one_by_x[165] <=  64'h018d36b3ffffffff  ;
			one_by_x[166] <=  64'h018ac9f1ffffffff  ;
			one_by_x[167] <=  64'h01886df7ffffffff  ;
			one_by_x[168] <=  64'h018611fdffffffff  ;
			one_by_x[169] <=  64'h0183c6c9ffffffff  ;
			one_by_x[170] <=  64'h01817b95ffffffff  ;
			one_by_x[171] <=  64'h017f4127ffffffff  ;
			one_by_x[172] <=  64'h017d06bbffffffff  ;
			one_by_x[173] <=  64'h017acc4dffffffff  ;
			one_by_x[174] <=  64'h0178a2a9ffffffff  ;
			one_by_x[175] <=  64'h01767903ffffffff  ;
			one_by_x[176] <=  64'h01746023ffffffff  ;
			one_by_x[177] <=  64'h01724745ffffffff  ;
			one_by_x[178] <=  64'h01702e65ffffffff  ;
			one_by_x[179] <=  64'h016e264dffffffff  ;
			one_by_x[180] <=  64'h016c1e35ffffffff  ;
			one_by_x[181] <=  64'h016a161dffffffff  ;
			one_by_x[182] <=  64'h01681ecdffffffff  ;
			one_by_x[183] <=  64'h016616b5ffffffff  ;
			one_by_x[184] <=  64'h0164302bffffffff  ;
			one_by_x[185] <=  64'h016238d9ffffffff  ;
			one_by_x[186] <=  64'h0160524fffffffff  ;
			one_by_x[187] <=  64'h015e7c8dffffffff  ;
			one_by_x[188] <=  64'h015c9603ffffffff  ;
			one_by_x[189] <=  64'h015ac03fffffffff  ;
			one_by_x[190] <=  64'h0158ea7bffffffff  ;
			one_by_x[191] <=  64'h0157257fffffffff  ;
			one_by_x[192] <=  64'h01554fbdffffffff  ;
			one_by_x[193] <=  64'h01538ac1ffffffff  ;
			one_by_x[194] <=  64'h0151d68bffffffff  ;
			one_by_x[195] <=  64'h0150118fffffffff  ;
			one_by_x[196] <=  64'h014e5d5bffffffff  ;
			one_by_x[197] <=  64'h014ca925ffffffff  ;
			one_by_x[198] <=  64'h014b05b7ffffffff  ;
			one_by_x[199] <=  64'h01495181ffffffff  ;
			one_by_x[200] <=  64'h0147ae13ffffffff  ;
			one_by_x[201] <=  64'h01460aa5ffffffff  ;
			one_by_x[202] <=  64'h01446737ffffffff  ;
			one_by_x[203] <=  64'h0142d48fffffffff  ;
			one_by_x[204] <=  64'h014141e9ffffffff  ;
			one_by_x[205] <=  64'h013faf41ffffffff  ;
			one_by_x[206] <=  64'h013e1c9bffffffff  ;
			one_by_x[207] <=  64'h013c9abbffffffff  ;
			one_by_x[208] <=  64'h013b18d9ffffffff  ;
			one_by_x[209] <=  64'h013996f9ffffffff  ;
			one_by_x[210] <=  64'h01381519ffffffff  ;
			one_by_x[211] <=  64'h01369339ffffffff  ;
			one_by_x[212] <=  64'h0135221fffffffff  ;
			one_by_x[213] <=  64'h0133b107ffffffff  ;
			one_by_x[214] <=  64'h01323fedffffffff  ;
			one_by_x[215] <=  64'h0130ced3ffffffff  ;
			one_by_x[216] <=  64'h012f6e81ffffffff  ;
			one_by_x[217] <=  64'h012dfd69ffffffff  ;
			one_by_x[218] <=  64'h012c9d15ffffffff  ;
			one_by_x[219] <=  64'h012b3cc3ffffffff  ;
			one_by_x[220] <=  64'h0129dc71ffffffff  ;
			one_by_x[221] <=  64'h01288ce7ffffffff  ;
			one_by_x[222] <=  64'h01273d5bffffffff  ;
			one_by_x[223] <=  64'h0125dd09ffffffff  ;
			one_by_x[224] <=  64'h01248d7dffffffff  ;
			one_by_x[225] <=  64'h01233df1ffffffff  ;
			one_by_x[226] <=  64'h0121ff2dffffffff  ;
			one_by_x[227] <=  64'h0120afa1ffffffff  ;
			one_by_x[228] <=  64'h011f70ddffffffff  ;
			one_by_x[229] <=  64'h011e3219ffffffff  ;
			one_by_x[230] <=  64'h011cf355ffffffff  ;
			one_by_x[231] <=  64'h011bb491ffffffff  ;
			one_by_x[232] <=  64'h011a75cdffffffff  ;
			one_by_x[233] <=  64'h011947cfffffffff  ;
			one_by_x[234] <=  64'h011819d1ffffffff  ;
			one_by_x[235] <=  64'h0116db0dffffffff  ;
			one_by_x[236] <=  64'h0115ad0fffffffff  ;
			one_by_x[237] <=  64'h01147f13ffffffff  ;
			one_by_x[238] <=  64'h011361dbffffffff  ;
			one_by_x[239] <=  64'h011233dfffffffff  ;
			one_by_x[240] <=  64'h011116a7ffffffff  ;
			one_by_x[241] <=  64'h010fe8abffffffff  ;
			one_by_x[242] <=  64'h010ecb73ffffffff  ;
			one_by_x[243] <=  64'h010dae3dffffffff  ;
			one_by_x[244] <=  64'h010c9107ffffffff  ;
			one_by_x[245] <=  64'h010b8497ffffffff  ;
			one_by_x[246] <=  64'h010a6761ffffffff  ;
			one_by_x[247] <=  64'h01095af1ffffffff  ;
			one_by_x[248] <=  64'h01083dbbffffffff  ;
			one_by_x[249] <=  64'h0107314bffffffff  ;
			one_by_x[250] <=  64'h010624ddffffffff  ;
			one_by_x[251] <=  64'h0105186dffffffff  ;
			one_by_x[252] <=  64'h01040bfdffffffff  ;
			one_by_x[253] <=  64'h01031055ffffffff  ;
			one_by_x[254] <=  64'h010203e5ffffffff  ;
			one_by_x[255] <=  64'h0101083dffffffff  ;
			one_by_x[256] <=  64'h00FF00FEFFFFFFFF  ;
			n1 <= 8'b0 ; 
		
				
	end
		else 
		begin
		
			numerator1 <= numerator ; 
			
			if (denom[63] ^ 1'b1   == 1'b0)
			begin
			lut_index <= denom[63:56] ; //+ 8'd1 ;
			n <= 8'd0 ;
			end                                  
			else if (denom[62] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[62:55] + 8'd1 ;       
			n <= 8'd1 ;
			end                                 
			else if (denom[61] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[61:54] + 8'd1 ;       
			n <= 8'd2 ;
			end                                
			else if (denom[60] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[60:53] + 8'd1 ;       
			n <= 8'd3 ;
			end                                
			else if (denom[59] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[59:52] + 8'd1 ;       
			n <= 8'd4 ;
			end                               
			else if (denom[58] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[58:51] + 8'd1 ;       
			n <= 8'd5 ;
			end                               
			else if (denom[57] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[57:50] + 8'd1 ;       
			n <= 8'd6 ;
			end                               
			else if (denom[56] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[56:49] + 8'd1 ;       
			n <= 8'd7 ;
			end                               
			else if (denom[55] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[55:48] + 8'd1 ;       
			n <= 8'd8 ;
			end                              
			else if (denom[54] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[54:47] + 8'd1 ;       
			n <= 8'd9 ;
			end 
			else if (denom[53] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[53:46] + 8'd1 ;       
			n <= 8'd10 ;
			end                             
			else if (denom[52] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[52:45] + 8'd1 ;       
			n <= 8'd11 ;
			end                            
			else if (denom[51] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[51:44] + 8'd1 ;       
			n <= 8'd12 ;
			end                           
			else if (denom[50] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[50:43] + 8'd1 ;       
			n <= 8'd13 ;
			end                          
			else if (denom[49] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[49:42] + 8'd1 ;       
			n <= 8'd14 ;
			end                         
			else if (denom[48] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[48:41] + 8'd1 ;       
			n <= 8'd15 ;
			end                        
			else if (denom[47] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[47:40] + 8'd1 ;       
			n <= 8'd16 ;
			end                        
			else if (denom[46] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[46:39] + 8'd1 ;       
			n <= 8'd17 ;
			end                       
			else if (denom[45] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[45:38] + 8'd1 ;       
			n <= 8'd18 ;
			end                       
			else if (denom[44] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[44:37] + 8'd1 ;       
			n <= 8'd19 ;
			end                      
			else if (denom[43] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[43:36] + 8'd1 ;       
			n <= 8'd20 ;
			end         
			else if (denom[42] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[42:35] + 8'd1 ;       
			n <= 8'd21 ;
			end 
			else if (denom[41] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[41:34] + 8'd1 ;       
			n <= 8'd22 ;
			end 
			else if (denom[40] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[40:33] + 8'd1 ;       
			n <= 8'd23 ;
			end 
			else if (denom[39] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[39:32] + 8'd1 ;       
			n <= 8'd24 ;
			end 
			else if (denom[38] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[38:31] + 8'd1 ;       
			n <= 8'd25 ;
			end 
			else if (denom[37] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[37:30] + 8'd1 ;       
			n <= 8'd26 ;
			end 
			else if (denom[36] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[36:29] + 8'd1 ;       
			n <= 8'd27 ;
			end 
			else if (denom[35] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[35:28] + 8'd1 ;       
			n <= 8'd28 ;
			end 
			else if (denom[34] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[34:27] + 8'd1 ;       
			n <= 8'd29 ;
			end 
			else if (denom[33] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[33:26] + 8'd1 ;       
			n <= 8'd30 ;
			end 
			else if (denom[32] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[32:25] + 8'd1 ;       
			n <= 8'd31 ;
			end 
			else if (denom[31] ^ 1'b1   == 1'b0)
			begin
			lut_index <= denom[31:24] + 8'd1 ;
			n <= 8'd32 ;			
			end                                  
			else if (denom[30] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[30:23] + 8'd1 ;       
			n <= 8'd33 ;
			end                                  
			else if (denom[29] ^ 1'b1   == 1'b0) 
			begin                                
			lut_index <= denom[29:22] + 8'd1 ;       
			n <= 8'd34 ;
			end			                         
			else if (denom[28] ^ 1'b1  == 1'b0)  
			begin                                
			lut_index <= denom[28:21] + 8'd1 ;       
			n <= 8'd35 ;
			end			                        
			else if (denom[27] ^ 1'b1  == 1'b0) 
			begin                               
			lut_index <= denom[27:20] + 8'd1 ;      
			n <= 8'd36 ;
			end			                         
			else if (denom[26] ^ 1'b1  == 1'b0)  
			begin                                
			lut_index <= denom[26:19] + 8'd1 ;       
			n <= 8'd37 ;
			end			                         
			else if (denom[25] ^ 1'b1  == 1'b0)  
			begin                                
			lut_index <= denom[25:18] + 8'd1 ;       
			n <= 8'd38 ;
			end				                     
			else if (denom[24] ^ 1'b1  == 1'b0)  
			begin                                
			lut_index <= denom[24:17] + 8'd1 ;       
			n <= 8'd39 ;
			end				                    
			else if (denom[23] ^ 1'b1  == 1'b0) 
			begin                               
			lut_index <= denom[23:16] + 8'd1 ;      
			n <= 8'd40 ;
			end				                     
			else if (denom[22] ^ 1'b1  == 1'b0)  
			begin                                
			lut_index <= denom[22:15] + 8'd1 ;       
			n <= 8'd41 ;
			end				                     
			else if (denom[21] ^ 1'b1 == 1'b0)   
			begin                                
			lut_index <= denom[21:14] + 8'd1 ;       
			n <= 8'd42 ;
			end				                     
			else if (denom[20] ^ 1'b1 == 1'b0)   
			begin                                
			lut_index <= denom[20:13] + 8'd1 ;       
			n <= 8'd43 ;
			end				                    
			else if (denom[19] ^ 1'b1 == 1'b0)  
			begin                               
			lut_index <= denom[19:12] + 8'd1 ;      
			n <= 8'd44 ;
			end				                     
			else if (denom[18] ^ 1'b1 == 1'b0)   
			begin                                
			lut_index <= denom[18:11] + 8'd1 ;       							
			n <= 8'd45 ;
			end				                     
			else if (denom[17] ^ 1'b1 == 1'b0)   
			begin                                
			lut_index <= denom[17:10] + 8'd1 ;       
			n <= 8'd46 ;
			end				                     
			else if (denom[16] ^ 1'b1 == 1'b0)   
			begin                                
			lut_index <= denom[16:9] + 8'd1  ;      
			n <= 8'd47 ;
			end				                    
			else if (denom[15] ^ 1'b1 == 1'b0)  
			begin                               
			lut_index <= denom[15:8] + 8'd1 ;       
			n <= 8'd48 ;
			end			                        
			else if (denom[14] ^ 1'b1 == 1'b0)  
			begin                               
			lut_index <= denom[14:7] + 8'd1 ;       
			n <= 8'd49 ;
			end			                        
			else if (denom[13] ^ 1'b1 == 1'b0)  
			begin                               
			lut_index <= denom[13:6] + 8'd1 ;       
			n <= 8'd50 ;
			end			                        
			else if (denom[12] ^ 1'b1 == 1'b0)  
			begin                               
			lut_index <= denom[12:5] + 8'd1 ;       
			n <= 8'd51 ;
			end			                        
			else if (denom[11] ^ 1'b1 == 1'b0)  
			begin                               
			lut_index <= denom[11:4] + 8'd1 ;       
			n <= 8'd52 ;
			end			                        
			else if (denom[10] ^ 1'b1 == 1'b0)  
			begin                               
			lut_index <= denom[10:3] + 8'd1 ;       
			n <= 8'd53 ;
			end			                        
			else if (denom[9 ] ^ 1'b1 == 1'b0)  
			begin                              
			lut_index <= denom[9:2] + 8'd1 ;        
			n <= 8'd54 ;
			end			                        
			else if (denom[8 ] ^ 1'b1 == 1'b0)  
			begin                               
			lut_index <= denom[8:1] + 8'd1 ;        
			n <= 8'd55 ;
			end			                        
			else if (denom[7 ] ^ 1'b1 == 1'b0)  
			begin                               
			lut_index <= denom[7:0] + 8'd1 ;        
			n <= 8'd56 ;
			end	
			else if (denom[6 ] ^ 1'b1 == 1'b0)
			begin
			lut_index <= {1'b0,denom[6:0]} + 8'd1 ;
			n <= 8'd57 ;
			end			  
			else if (denom[5 ] ^ 1'b1 == 1'b0)
			begin
			lut_index <= {2'b0,denom[5:0]} + 8'd1 ;
			n <= 8'd58 ;
			end			  
			else if (denom[4 ] ^ 1'b1 == 1'b0)
			begin
			lut_index <= {3'b0,denom[4:0]} + 8'd1 ;
			n <= 8'd59 ;
			end			  
			else if (denom[3 ] ^ 1'b1 == 1'b0)
			begin
			lut_index <= {4'b0,denom[3:0]} + 8'd1;
			n <= 8'd60 ;
			end			  
			else if (denom[2 ] ^ 1'b1 == 1'b0)
			begin
			lut_index <= {5'b0,denom[2:0]} + 8'd1;
			n <= 8'd61 ;
			end			                                 
			else if (denom[1 ] ^ 1'b1 == 1'b0)           
			begin                                        
			lut_index <= {6'b0,denom[1:0]} + 8'd1;           
			n <= 8'd62 ;
			end			                                 
			else if (denom[0 ] ^ 1'b1 == 1'b0)           
			begin                                        
			lut_index <= {7'b0,denom[0]} + 8'd1 ;            
			n <= 8'd63 ;
			end	
		    n1 <= n ; 
			a_div <= one_by_x[lut_index] * numerator1 ;//sub_lut ;
			
			div <= a_div[127:64] <<< (n1+4'd8)	 /*+ 4'd4)*//*(8'd64 + n)*/ ;
			end
	end
assign h = one_by_x[lut_index] ;
assign t = a_div;
assign t1 = lut_index;//sub_lut;
assign t2 = numerator1;

endmodule
/*

module DIV_tb();
reg clock, rst;
reg [63:0] num,dnom;

wire [63:0] div ;
// wire [63:0] div , h ;
// wire [127:0] t;
// wire [7:0] t1,t2;
DIV d1(clock, rst, num, dnom, div);

initial
	begin
		clock = 1'b1;
num = 64'h0000bc9d014e28a4;
dnom = 64'h028f5c27ffffffff;
// rst  = 1'b1; 
rst = 1'b0;
rst = #16 1'b1;
	
	
	
	end
 always 
   begin
   #8 clock = ~clock;/*0111011001001100001011110111111111111111111111111111111111111111
   0001010001111010111000010011111111111111111111111111111111111111
    end









endmodule
*/
