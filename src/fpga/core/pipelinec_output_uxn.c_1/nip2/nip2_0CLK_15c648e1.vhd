-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 59
entity nip2_0CLK_15c648e1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end nip2_0CLK_15c648e1;
architecture arch of nip2_0CLK_15c648e1 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2312_c6_4026]
signal BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2312_c1_eefb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2312_c2_96f8]
signal t16_MUX_uxn_opcodes_h_l2312_c2_96f8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2312_c2_96f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2312_c2_96f8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2312_c2_96f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2312_c2_96f8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2312_c2_96f8]
signal result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2312_c2_96f8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output : signed(3 downto 0);

-- printf_uxn_opcodes_h_l2313_c3_9028[uxn_opcodes_h_l2313_c3_9028]
signal printf_uxn_opcodes_h_l2313_c3_9028_uxn_opcodes_h_l2313_c3_9028_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2317_c11_1190]
signal BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2317_c7_3ed1]
signal t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2317_c7_3ed1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2317_c7_3ed1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2317_c7_3ed1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2317_c7_3ed1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2317_c7_3ed1]
signal result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2317_c7_3ed1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2320_c11_346c]
signal BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2320_c7_52ac]
signal t16_MUX_uxn_opcodes_h_l2320_c7_52ac_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2320_c7_52ac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2320_c7_52ac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2320_c7_52ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2320_c7_52ac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2320_c7_52ac]
signal result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2320_c7_52ac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output : signed(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2322_c3_297b]
signal CONST_SL_8_uxn_opcodes_h_l2322_c3_297b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2322_c3_297b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2325_c11_8103]
signal BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2325_c7_2f40]
signal t16_MUX_uxn_opcodes_h_l2325_c7_2f40_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2325_c7_2f40]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2325_c7_2f40]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2325_c7_2f40]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2325_c7_2f40]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2325_c7_2f40]
signal result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2325_c7_2f40]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2328_c11_51f7]
signal BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2328_c7_5971]
signal t16_MUX_uxn_opcodes_h_l2328_c7_5971_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2328_c7_5971_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2328_c7_5971]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2328_c7_5971]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2328_c7_5971]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2328_c7_5971]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2328_c7_5971]
signal result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2328_c7_5971]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2329_c3_5037]
signal BIN_OP_OR_uxn_opcodes_h_l2329_c3_5037_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2329_c3_5037_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2329_c3_5037_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2331_c30_cda6]
signal sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2336_c11_301b]
signal BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2336_c7_4a1b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2336_c7_4a1b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2336_c7_4a1b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2336_c7_4a1b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2336_c7_4a1b]
signal result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2339_c31_70f5]
signal CONST_SR_8_uxn_opcodes_h_l2339_c31_70f5_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2339_c31_70f5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2341_c11_fb7c]
signal BIN_OP_EQ_uxn_opcodes_h_l2341_c11_fb7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2341_c11_fb7c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2341_c11_fb7c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2341_c7_89e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2341_c7_89e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_641b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026
BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_left,
BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_right,
BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_return_output);

-- t16_MUX_uxn_opcodes_h_l2312_c2_96f8
t16_MUX_uxn_opcodes_h_l2312_c2_96f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2312_c2_96f8_cond,
t16_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue,
t16_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse,
t16_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8
result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8
result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8
result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8
result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output);

-- printf_uxn_opcodes_h_l2313_c3_9028_uxn_opcodes_h_l2313_c3_9028
printf_uxn_opcodes_h_l2313_c3_9028_uxn_opcodes_h_l2313_c3_9028 : entity work.printf_uxn_opcodes_h_l2313_c3_9028_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2313_c3_9028_uxn_opcodes_h_l2313_c3_9028_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_left,
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_right,
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_return_output);

-- t16_MUX_uxn_opcodes_h_l2317_c7_3ed1
t16_MUX_uxn_opcodes_h_l2317_c7_3ed1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond,
t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue,
t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse,
t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1
result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1
result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c
BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_left,
BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_right,
BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_return_output);

-- t16_MUX_uxn_opcodes_h_l2320_c7_52ac
t16_MUX_uxn_opcodes_h_l2320_c7_52ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2320_c7_52ac_cond,
t16_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue,
t16_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse,
t16_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac
result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac
result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac
result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_cond,
result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac
result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2322_c3_297b
CONST_SL_8_uxn_opcodes_h_l2322_c3_297b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2322_c3_297b_x,
CONST_SL_8_uxn_opcodes_h_l2322_c3_297b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103
BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_left,
BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_right,
BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_return_output);

-- t16_MUX_uxn_opcodes_h_l2325_c7_2f40
t16_MUX_uxn_opcodes_h_l2325_c7_2f40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2325_c7_2f40_cond,
t16_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue,
t16_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse,
t16_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40
result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40
result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40
result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40
result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_cond,
result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40
result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7
BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_left,
BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_right,
BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_return_output);

-- t16_MUX_uxn_opcodes_h_l2328_c7_5971
t16_MUX_uxn_opcodes_h_l2328_c7_5971 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2328_c7_5971_cond,
t16_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue,
t16_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse,
t16_MUX_uxn_opcodes_h_l2328_c7_5971_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971
result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971
result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971
result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971
result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_cond,
result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971
result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2329_c3_5037
BIN_OP_OR_uxn_opcodes_h_l2329_c3_5037 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2329_c3_5037_left,
BIN_OP_OR_uxn_opcodes_h_l2329_c3_5037_right,
BIN_OP_OR_uxn_opcodes_h_l2329_c3_5037_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6
sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_ins,
sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_x,
sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_y,
sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b
BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_left,
BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_right,
BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b
result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b
result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b
result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b
result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2339_c31_70f5
CONST_SR_8_uxn_opcodes_h_l2339_c31_70f5 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2339_c31_70f5_x,
CONST_SR_8_uxn_opcodes_h_l2339_c31_70f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2341_c11_fb7c
BIN_OP_EQ_uxn_opcodes_h_l2341_c11_fb7c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2341_c11_fb7c_left,
BIN_OP_EQ_uxn_opcodes_h_l2341_c11_fb7c_right,
BIN_OP_EQ_uxn_opcodes_h_l2341_c11_fb7c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2
result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2
result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_return_output,
 t16_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_return_output,
 t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_return_output,
 t16_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output,
 CONST_SL_8_uxn_opcodes_h_l2322_c3_297b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_return_output,
 t16_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_return_output,
 t16_MUX_uxn_opcodes_h_l2328_c7_5971_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2329_c3_5037_return_output,
 sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output,
 CONST_SR_8_uxn_opcodes_h_l2339_c31_70f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2341_c11_fb7c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2312_c2_96f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_3ebe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2313_c3_9028_uxn_opcodes_h_l2313_c3_9028_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2318_c3_a4f5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2320_c7_52ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2323_c3_53ca : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2322_c3_297b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2322_c3_297b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2328_c7_5971_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2325_c7_2f40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2326_c3_995e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2328_c7_5971_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2333_c3_98c3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2329_c3_5037_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2329_c3_5037_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2329_c3_5037_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2334_c21_b618_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2338_c3_6c60 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2336_c7_4a1b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2339_c31_70f5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2339_c31_70f5_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2339_c21_95cd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_fb7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_fb7c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_fb7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2336_l2325_DUPLICATE_37c2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2341_l2336_l2325_DUPLICATE_447d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2336_l2325_DUPLICATE_de09_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2328_l2325_DUPLICATE_f1eb_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2320_l2317_l2341_l2336_l2328_l2325_DUPLICATE_65d1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2329_l2321_DUPLICATE_aa4f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2308_l2346_DUPLICATE_623b_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2323_c3_53ca := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2323_c3_53ca;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2318_c3_a4f5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2318_c3_a4f5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2333_c3_98c3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2333_c3_98c3;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2326_c3_995e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2326_c3_995e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_fb7c_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_3ebe := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_3ebe;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2338_c3_6c60 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2338_c3_6c60;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_fb7c_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2329_c3_5037_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2339_c31_70f5_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2320_l2317_l2341_l2336_l2328_l2325_DUPLICATE_65d1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2320_l2317_l2341_l2336_l2328_l2325_DUPLICATE_65d1_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2336_l2325_DUPLICATE_37c2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2336_l2325_DUPLICATE_37c2_return_output := result.is_sp_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2336_c7_4a1b] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2336_c7_4a1b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2317_c11_1190] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_left;
     BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_return_output := BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2336_c11_301b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2325_c11_8103] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_left;
     BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_return_output := BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2336_l2325_DUPLICATE_de09 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2336_l2325_DUPLICATE_de09_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2320_c11_346c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2329_l2321_DUPLICATE_aa4f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2329_l2321_DUPLICATE_aa4f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2328_c11_51f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2339_c31_70f5] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2339_c31_70f5_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2339_c31_70f5_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2339_c31_70f5_return_output := CONST_SR_8_uxn_opcodes_h_l2339_c31_70f5_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2331_c30_cda6] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_ins;
     sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_x;
     sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_return_output := sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2328_l2325_DUPLICATE_f1eb LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2328_l2325_DUPLICATE_f1eb_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2312_c6_4026] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_left;
     BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_return_output := BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2341_c11_fb7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2341_c11_fb7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_fb7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2341_c11_fb7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_fb7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_fb7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2341_c11_fb7c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2341_l2336_l2325_DUPLICATE_447d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2341_l2336_l2325_DUPLICATE_447d_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2312_c2_96f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c6_4026_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1190_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2320_c7_52ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_346c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2325_c7_2f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2325_c11_8103_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2328_c7_5971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_51f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_301b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_fb7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_fb7c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2329_c3_5037_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2329_l2321_DUPLICATE_aa4f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2322_c3_297b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2329_l2321_DUPLICATE_aa4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2328_l2325_DUPLICATE_f1eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2328_l2325_DUPLICATE_f1eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2328_l2325_DUPLICATE_f1eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2328_l2325_DUPLICATE_f1eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2328_l2325_DUPLICATE_f1eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2320_l2317_l2341_l2336_l2328_l2325_DUPLICATE_65d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2320_l2317_l2341_l2336_l2328_l2325_DUPLICATE_65d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2320_l2317_l2341_l2336_l2328_l2325_DUPLICATE_65d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2320_l2317_l2341_l2336_l2328_l2325_DUPLICATE_65d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2320_l2317_l2341_l2336_l2328_l2325_DUPLICATE_65d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2320_l2317_l2341_l2336_l2328_l2325_DUPLICATE_65d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2336_l2325_DUPLICATE_37c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2336_l2325_DUPLICATE_37c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2336_l2325_DUPLICATE_37c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2336_l2325_DUPLICATE_37c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2336_l2325_DUPLICATE_37c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2341_l2336_l2325_DUPLICATE_447d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2341_l2336_l2325_DUPLICATE_447d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2341_l2336_l2325_DUPLICATE_447d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2341_l2336_l2325_DUPLICATE_447d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2341_l2336_l2325_DUPLICATE_447d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2341_l2336_l2325_DUPLICATE_447d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2336_l2325_DUPLICATE_de09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2336_l2325_DUPLICATE_de09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2336_l2325_DUPLICATE_de09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2336_l2325_DUPLICATE_de09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2320_l2317_l2312_l2336_l2325_DUPLICATE_de09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2336_c7_4a1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2331_c30_cda6_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2336_c7_4a1b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2339_c21_95cd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2339_c21_95cd_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2339_c31_70f5_return_output);

     -- CONST_SL_8[uxn_opcodes_h_l2322_c3_297b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2322_c3_297b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2322_c3_297b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2322_c3_297b_return_output := CONST_SL_8_uxn_opcodes_h_l2322_c3_297b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2336_c7_4a1b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2341_c7_89e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2329_c3_5037] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2329_c3_5037_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2329_c3_5037_left;
     BIN_OP_OR_uxn_opcodes_h_l2329_c3_5037_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2329_c3_5037_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2329_c3_5037_return_output := BIN_OP_OR_uxn_opcodes_h_l2329_c3_5037_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2341_c7_89e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2312_c1_eefb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2328_c7_5971] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2329_c3_5037_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2339_c21_95cd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2322_c3_297b_return_output;
     VAR_printf_uxn_opcodes_h_l2313_c3_9028_uxn_opcodes_h_l2313_c3_9028_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2312_c1_eefb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_89e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_89e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_5971_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2334_c21_b618] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2334_c21_b618_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2329_c3_5037_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2328_c7_5971] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_return_output;

     -- t16_MUX[uxn_opcodes_h_l2328_c7_5971] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2328_c7_5971_cond <= VAR_t16_MUX_uxn_opcodes_h_l2328_c7_5971_cond;
     t16_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue;
     t16_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2328_c7_5971_return_output := t16_MUX_uxn_opcodes_h_l2328_c7_5971_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2336_c7_4a1b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output;

     -- printf_uxn_opcodes_h_l2313_c3_9028[uxn_opcodes_h_l2313_c3_9028] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2313_c3_9028_uxn_opcodes_h_l2313_c3_9028_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2313_c3_9028_uxn_opcodes_h_l2313_c3_9028_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l2336_c7_4a1b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2325_c7_2f40] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2328_c7_5971] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2336_c7_4a1b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2334_c21_b618_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_5971_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_5971_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2336_c7_4a1b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2328_c7_5971_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2320_c7_52ac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2328_c7_5971] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_return_output := result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2325_c7_2f40] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2328_c7_5971] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2325_c7_2f40] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output;

     -- t16_MUX[uxn_opcodes_h_l2325_c7_2f40] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2325_c7_2f40_cond <= VAR_t16_MUX_uxn_opcodes_h_l2325_c7_2f40_cond;
     t16_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue;
     t16_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output := t16_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2328_c7_5971] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_5971_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_5971_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_5971_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2317_c7_3ed1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2320_c7_52ac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2325_c7_2f40] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output := result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output;

     -- t16_MUX[uxn_opcodes_h_l2320_c7_52ac] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2320_c7_52ac_cond <= VAR_t16_MUX_uxn_opcodes_h_l2320_c7_52ac_cond;
     t16_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue;
     t16_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output := t16_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2320_c7_52ac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2325_c7_2f40] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2325_c7_2f40] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2325_c7_2f40_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output;
     -- t16_MUX[uxn_opcodes_h_l2317_c7_3ed1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond;
     t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue;
     t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output := t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2317_c7_3ed1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2320_c7_52ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2320_c7_52ac] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output := result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2312_c2_96f8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2320_c7_52ac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2317_c7_3ed1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_52ac_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2317_c7_3ed1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2312_c2_96f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output;

     -- t16_MUX[uxn_opcodes_h_l2312_c2_96f8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2312_c2_96f8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2312_c2_96f8_cond;
     t16_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue;
     t16_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output := t16_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2317_c7_3ed1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2317_c7_3ed1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2312_c2_96f8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_3ed1_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2312_c2_96f8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2312_c2_96f8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2312_c2_96f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2308_l2346_DUPLICATE_623b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2308_l2346_DUPLICATE_623b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c2_96f8_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2308_l2346_DUPLICATE_623b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2308_l2346_DUPLICATE_623b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
