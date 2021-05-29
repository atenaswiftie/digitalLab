module registers(read_reg_1, 
                 read_reg_2,
                 write_status,
                 write_reg,
                 write_data,
                 read_data_1,
                 read_data_2);

input[4:0] read_reg_1,read_reg_2,write_reg;
input write_status;
input[31:0] write_data;

output reg[63:0] read_data_1, read_data_2;

parameter address_size = 64;
parameter data_size    = 32;

reg [address_size-1:0] data [data_size-1 : 0];



always@(read_register_1)
begin
    read_data_1 <= (read_register_1 ! = 0) ? data[read_register_1] : 0
end


always@(read_register_2)
begin
    read_data_1 <= (read_register_2 ! = 0) ? data[read_register_2] : 0
end


always@(write_status)

begin

    (write_status == 2'b1)  data[write_reg] <= write_data
end
