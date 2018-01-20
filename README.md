README file for Distributed Systems - Project 1
Date: September 18th, 2017

Group members:

1. Raghav Ravishankar, UFID: 19995874, raghav29@ufl.edu
2. Suhas Kumar Bharadwaj, UFID: 16120229, suhaskb@ufl.edu

Source Files Location:

project1/lib/project1.ex

Usage:

1.	FOR LOCAL IMPLEMENTATION:

	mix escript.build
	escript project1 (leading no. of zeroes)

		where:
		(leading no. of zeroes) will be the required number of prefixed 0's in the generated bitcoin.
		
2.  FOR REMOTE IMPLEMENTATION:

	escript project1 (ip address of the master miner)

Implementation Details:

	1. The string generation in our project for mining bitcoins uses a recursive approach, with a fixed string length of 16 aplhanumeric characters prefixed with a unique UFID.
			The Miner assigns work to the workers in continuous batches of work units. Once the coins are mined, they are sent back to the server where the coins are outputted.
			In the case of clients, 
		
		
		   
	

	2. The result of running your program for 
		./project1 4
				
		raghav29;856FF5F2EA81839D    00008AB9245244978D70A008C4AA633145F53A5D03D4CE055C3AD7E5F4170D6C
		raghav29;87D2D4FC7791D95C    00005D42DEE834662EF9E2B14D9C6DC29BD01ADBF31F4D22F1902D4E11910AC5
		raghav29;16CB81EBA47E6AB8    00008A3A753012F41AED31CFE7759501CB7C4D548E493C85ADD5DD6D1BA4E12D
		raghav29;29E7CB0B8EDC9F65    0000512BE7B6C5012E565303E4A22D6285D1272CBC597E600B8279B400F783C0
		raghav29;E0E8B41AD40D2728    000018240FCDDEECCDA2C17A40D55FA608D2A295511177107F20639FB995E28D
	
	3.  The run time of the program on a Intel i7 machine with 2 cores and 4 threads(4 virtual cores with hyper threading) at 2.4 GHz is given below:
		time escript project1 4
		
		raghav291672E3A88230D42D 000047BDDAAAB04683F785C8D4E861F91095ACB0E08E09E6E2682BF99B29814A
		raghav292A3747094D30CEFA 000006D40FEA31D6D3A19EFDF8973C95C6B5E5C6F1DA2DFD134F5E9C520C12F1
		raghav292776F765C0B83024 0000618720B95FE192B8F8F973D8E48015C737B733855138B52C99B183D62A9E
		raghav29B952D552D9EEE452 00007209AE9FA28A2E4EE05216C5575DFBCDD21BB51AF8A05C2F5275CF91A304
		raghav29DC898E6227DDEEC5 0000FF608DED3C789238C191B63187CD2EEBA17B3B6708D4588782AF66748F97
		raghav29CBA6308F55B94A52 0000B095995094E05A0986E24B2D21AAD1358B9CB04FCEAD7BCD7BD447663FD8
		raghav2961DB0EB331E620A9 0000B648991035DB57CDE718421A569ACBB0F67F161A7964983838A0F88CD61A
		^C
		real	0m35.665s
		user	2m15.164s
		sys	0m0.508s
	
		Here, Total CPU time = 4m45.268s = 285.268 seconds.
		Real time = 1m19.720s = 79.72 seconds
		
		The ratio of CPU Time to REAL Time is 3.57
		
	3. The coin with the most number of leading zeroes that we were able to find - 8 zeroes.
	
	4. The largest number of working machines we tested our code on was with 5 machines (4 miners and one master).
	
		
			
