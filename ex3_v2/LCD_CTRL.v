`timescale 1ns / 1ps

module LCD_CTRL(clk,
				reset,
				datain,
				cmd,
				cmd_valid,
				dataout,
				output_valid,
				busy,
				state,
				next_state,
				flag_cmd,
				//image_mem_temp,
				//data_out_bits_cnt3,
				data_cnt,
				data_out_bits_cnt,
				data_out_bits_cnt2,
				data_out_cnt,
				data_out_cnt1,
				add,
				add_1
				);

input clk,reset;
input [7:0] datain;
input[2:0] cmd;
input cmd_valid;
output reg [7:0] dataout;
output reg output_valid;
output reg busy;

output reg [2:0]flag_cmd;
 reg [7:0]image_mem_temp[107:0];
 reg [6:0]data_out_bits_cnt3[15:0];
output reg [6:0]data_cnt;
output reg [6:0]data_out_bits_cnt;
output reg [6:0]data_out_bits_cnt2;
output reg [3:0]data_out_cnt;
output reg [3:0]data_out_cnt1;
output reg add;
output reg add_1;
integer i;

parameter initial_state = 1;
parameter zoom_fit_state = 2;
parameter zoom_in = 3;
output reg [1:0]state; 
output reg [1:0]next_state;

always@(posedge clk or posedge reset)begin
	if(reset)
		busy<=0;
	else begin
		if(cmd_valid)
			busy <= 1;
		else if (data_out_cnt1 == 15)
			busy <= 0;
	end
end
always@(posedge clk or posedge reset)begin
	if(reset)begin
		flag_cmd<=0;	
	end
	else begin
		if(cmd_valid)
			flag_cmd <= cmd ;
		else
			flag_cmd <= flag_cmd;
	end
end

always@(posedge clk or posedge reset)begin
	if(reset)
		add_1<=0;
	else
		add_1<=add;
end

always@(posedge clk or posedge reset)begin
	if(reset)
		data_out_cnt1<=0;
	else
		data_out_cnt1<=data_out_cnt;
end

always@(posedge clk or posedge reset)begin
	if(reset)begin
		for(i=0;i<108;i=i+1)begin
			image_mem_temp[i]<=0;
		end
	end	
	else begin
		if(state != initial_state )begin
			if(flag_cmd == 0 && data_cnt <= 107)begin
				image_mem_temp[data_cnt] <= datain;
			end
			else	
				image_mem_temp[data_cnt] <= image_mem_temp[data_cnt];
		end
	end
end

always@(posedge clk or posedge reset)begin
	if(reset)
		data_cnt<=0;
	else begin
		if(state != initial_state )begin
			if(cmd == 0 && cmd_valid)
				data_cnt<=0;
			else if(data_cnt == 107)
				data_cnt<=108;
			else
				data_cnt<=data_cnt + 1;
		end
		else
			data_cnt<=0;
	end
end

always@(posedge clk or posedge reset)begin
	if(reset)
		add<=0;
	else begin
		if (data_out_cnt == 15)
			add <= 0;
		else if((state == zoom_fit_state || state == zoom_in) && data_cnt == 107)
			add <= 1;
	end
end	

always@(posedge clk or posedge reset)begin
	if(reset)
		data_out_cnt<=0;
	else begin
		if(add)
			data_out_cnt <= data_out_cnt+1;
		else
			data_out_cnt <= 0;
	end
end

always@(posedge clk or posedge reset)begin
	if(reset)
		data_out_bits_cnt<=13;
	else begin
		if(add && state == zoom_fit_state)begin
			if(data_out_bits_cnt == 22 || data_out_bits_cnt == 46 || data_out_bits_cnt == 70 )
				data_out_bits_cnt <= data_out_bits_cnt + 15 ;
			else
				data_out_bits_cnt <= data_out_bits_cnt + 3 ;
		end
		else
			data_out_bits_cnt <= 13;
	end
end

always@(posedge clk or posedge reset)begin
	if(reset)
		data_out_bits_cnt2<=40;
	else begin
		 if (add && state == zoom_in )begin
			if(data_out_bits_cnt2 == 43 || data_out_bits_cnt2 == 55 || data_out_bits_cnt2 == 67 )
				data_out_bits_cnt2 <= data_out_bits_cnt2 + 9 ;
			else
				data_out_bits_cnt2 <= data_out_bits_cnt2 + 1 ;
		end
		else
			data_out_bits_cnt2 <= 40;
	end
end
		
always@(posedge clk or posedge reset)begin
	if(reset)begin
		data_out_bits_cnt3[0] 	<= 40;
		data_out_bits_cnt3[1] 	<= 41;
		data_out_bits_cnt3[2] 	<= 42;
		data_out_bits_cnt3[3] 	<= 43;
		data_out_bits_cnt3[4] 	<= 52;
		data_out_bits_cnt3[5] 	<= 53;
		data_out_bits_cnt3[6]	<= 54;
		data_out_bits_cnt3[7] 	<= 55;
		data_out_bits_cnt3[8] 	<= 64;
		data_out_bits_cnt3[9] 	<= 65;
		data_out_bits_cnt3[10] 	<= 66;
		data_out_bits_cnt3[11] 	<= 67;
		data_out_bits_cnt3[12] 	<= 76;
		data_out_bits_cnt3[13]	<= 77;
		data_out_bits_cnt3[14] 	<= 78;
		data_out_bits_cnt3[15] 	<= 79;
	end
	else begin
		if(state == zoom_in )begin
			if(cmd == 3 && cmd_valid)begin
				if(data_out_bits_cnt3[3] == 11 || data_out_bits_cnt3[3] == 23 || data_out_bits_cnt3[3] ==35 || data_out_bits_cnt3[3] == 47 || data_out_bits_cnt3[3] == 59
					|| data_out_bits_cnt3[3] == 71)begin
						for(i=0;i<16;i=i+1)
							data_out_bits_cnt3[i] <= data_out_bits_cnt3[i];
					end
				else begin
					for(i=0;i<16;i=i+1)
						data_out_bits_cnt3[i] <= data_out_bits_cnt3[i] + 1;
				end
			end
			else if(cmd == 4 && cmd_valid)begin
				if(data_out_bits_cnt3[0] == 0 || data_out_bits_cnt3[0] == 12 || data_out_bits_cnt3[0] ==24 || data_out_bits_cnt3[0] == 34 || data_out_bits_cnt3[0] == 48
					|| data_out_bits_cnt3[0] == 60)begin
						for(i=0;i<16;i=i+1)
							data_out_bits_cnt3[i] <= data_out_bits_cnt3[i];
					end				
				else begin
					for(i=0;i<16;i=i+1)
						data_out_bits_cnt3[i] <= data_out_bits_cnt3[i] - 1;
				end
			end
			else if(cmd == 5 && cmd_valid)begin
				if(data_out_bits_cnt3[0] == 0 || data_out_bits_cnt3[0] == 1 || data_out_bits_cnt3[0] ==2 || data_out_bits_cnt3[0] == 3 || data_out_bits_cnt3[0] == 4
					|| data_out_bits_cnt3[0] == 5|| data_out_bits_cnt3[0] == 6|| data_out_bits_cnt3[0] == 7|| data_out_bits_cnt3[0] == 8)begin
						for(i=0;i<16;i=i+1)
							data_out_bits_cnt3[i] <= data_out_bits_cnt3[i];
					end
				else begin
					for(i=0;i<16;i=i+1)
						data_out_bits_cnt3[i] <= data_out_bits_cnt3[i] - 12;
				end
			end
			else if(cmd == 6 && cmd_valid)begin
				if(data_out_bits_cnt3[12] == 96 || data_out_bits_cnt3[12] == 97 || data_out_bits_cnt3[12] ==98 || data_out_bits_cnt3[12] == 99 || data_out_bits_cnt3[12] == 100
					|| data_out_bits_cnt3[12] == 101 || data_out_bits_cnt3[12] == 102 || data_out_bits_cnt3[12] == 103 || data_out_bits_cnt3[12] == 104)begin
						for(i=0;i<16;i=i+1)
							data_out_bits_cnt3[i] <= data_out_bits_cnt3[i];
					end
				else begin
					for(i=0;i<16;i=i+1)
						data_out_bits_cnt3[i] <= data_out_bits_cnt3[i] + 12;
				end
			end
			else if (cmd == 1 && cmd_valid)begin
				for(i=0;i<16;i=i+1)
							data_out_bits_cnt3[i] <= data_out_bits_cnt3[i];
			end
		end
		else begin
			data_out_bits_cnt3[0] 	<= 40;
			data_out_bits_cnt3[1] 	<= 41;
			data_out_bits_cnt3[2] 	<= 42;
			data_out_bits_cnt3[3] 	<= 43;
			data_out_bits_cnt3[4] 	<= 52;
			data_out_bits_cnt3[5] 	<= 53;
			data_out_bits_cnt3[6]	<= 54;
			data_out_bits_cnt3[7] 	<= 55;
			data_out_bits_cnt3[8] 	<= 64;
			data_out_bits_cnt3[9] 	<= 65;
			data_out_bits_cnt3[10] 	<= 66;
			data_out_bits_cnt3[11] 	<= 67;
			data_out_bits_cnt3[12] 	<= 76;
			data_out_bits_cnt3[13]	<= 77;
			data_out_bits_cnt3[14] 	<= 78;
			data_out_bits_cnt3[15] 	<= 79;
		end	
	end
end

always@(posedge clk or posedge reset)begin
	if(reset)
		dataout<=0;
	else begin
		if(state == zoom_fit_state)begin
			if(add)begin
				dataout<=image_mem_temp[data_out_bits_cnt];
			end
		end
		else if (state == zoom_in)begin
			if(add)begin
				dataout<=image_mem_temp[data_out_bits_cnt3[data_out_cnt]];
			end
		end
	end
end

always@(posedge clk or posedge reset)begin
	if(reset)
		output_valid<=0;
	else begin
		if(data_cnt == 108 && add ==1)
			output_valid <= 1;
		else if (data_out_cnt1 == 15)
			output_valid <= 0;
	end
end

always@(*)begin
	if(reset)
		next_state<=2;
	else begin
		case(state)
			initial_state : begin //1
								next_state <= zoom_fit_state; 
							end
			zoom_fit_state	  :	begin //2
								next_state <= (flag_cmd == 0) 	? zoom_fit_state :
											  (flag_cmd == 1)   ? zoom_in  : zoom_fit_state;
							end
			zoom_in 	  : begin //3
								next_state <= (flag_cmd == 0) ? zoom_fit_state :
											  (flag_cmd == 2)  ? zoom_fit_state : zoom_in;
							end
			default		  : begin
								next_state <= initial_state;
							end
		endcase
	end
end

always@(posedge clk or posedge reset)begin
	if(reset)
		state<=initial_state;
	else begin
		state<=next_state;
	end
end
endmodule
