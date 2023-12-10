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
-- Submodules: 58
entity equ2_0CLK_0226dad5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_0226dad5;
architecture arch of equ2_0CLK_0226dad5 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1174_c6_ba60]
signal BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1174_c2_0180]
signal n16_MUX_uxn_opcodes_h_l1174_c2_0180_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1174_c2_0180_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1174_c2_0180]
signal t16_MUX_uxn_opcodes_h_l1174_c2_0180_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1174_c2_0180_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1174_c2_0180]
signal result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1174_c2_0180]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1174_c2_0180]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1174_c2_0180]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1174_c2_0180]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1181_c11_65d0]
signal BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1181_c7_5c8f]
signal n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1181_c7_5c8f]
signal t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1181_c7_5c8f]
signal result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1181_c7_5c8f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1181_c7_5c8f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1181_c7_5c8f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1181_c7_5c8f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1184_c11_2f66]
signal BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1184_c7_0fd0]
signal n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1184_c7_0fd0]
signal t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1184_c7_0fd0]
signal result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1184_c7_0fd0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1184_c7_0fd0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1184_c7_0fd0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1184_c7_0fd0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1189_c11_2665]
signal BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1189_c7_3f94]
signal n16_MUX_uxn_opcodes_h_l1189_c7_3f94_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1189_c7_3f94]
signal t16_MUX_uxn_opcodes_h_l1189_c7_3f94_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1189_c7_3f94]
signal result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1189_c7_3f94]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1189_c7_3f94]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1189_c7_3f94]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1189_c7_3f94]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1190_c3_4260]
signal BIN_OP_OR_uxn_opcodes_h_l1190_c3_4260_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1190_c3_4260_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1190_c3_4260_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1193_c11_de96]
signal BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1193_c7_7e29]
signal n16_MUX_uxn_opcodes_h_l1193_c7_7e29_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1193_c7_7e29]
signal result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1193_c7_7e29]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1193_c7_7e29]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1193_c7_7e29]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1193_c7_7e29]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1197_c11_dd4a]
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1197_c7_4d89]
signal n16_MUX_uxn_opcodes_h_l1197_c7_4d89_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1197_c7_4d89]
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c7_4d89]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c7_4d89]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c7_4d89]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c7_4d89]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1198_c3_e64e]
signal BIN_OP_OR_uxn_opcodes_h_l1198_c3_e64e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1198_c3_e64e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1198_c3_e64e_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1200_c30_69de]
signal sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1203_c21_ded1]
signal BIN_OP_EQ_uxn_opcodes_h_l1203_c21_ded1_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1203_c21_ded1_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1203_c21_ded1_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1203_c21_1357]
signal MUX_uxn_opcodes_h_l1203_c21_1357_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1203_c21_1357_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1203_c21_1357_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1203_c21_1357_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1205_c11_8387]
signal BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1205_c7_ec6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1205_c7_ec6f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1205_c7_ec6f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_return_output : signed(3 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1186_l1195_DUPLICATE_c1bb
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1186_l1195_DUPLICATE_c1bb_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1186_l1195_DUPLICATE_c1bb_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_eae7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60
BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_left,
BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_right,
BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_return_output);

-- n16_MUX_uxn_opcodes_h_l1174_c2_0180
n16_MUX_uxn_opcodes_h_l1174_c2_0180 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1174_c2_0180_cond,
n16_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue,
n16_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse,
n16_MUX_uxn_opcodes_h_l1174_c2_0180_return_output);

-- t16_MUX_uxn_opcodes_h_l1174_c2_0180
t16_MUX_uxn_opcodes_h_l1174_c2_0180 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1174_c2_0180_cond,
t16_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue,
t16_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse,
t16_MUX_uxn_opcodes_h_l1174_c2_0180_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180
result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_cond,
result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180
result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0
BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_left,
BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_right,
BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_return_output);

-- n16_MUX_uxn_opcodes_h_l1181_c7_5c8f
n16_MUX_uxn_opcodes_h_l1181_c7_5c8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond,
n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue,
n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse,
n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output);

-- t16_MUX_uxn_opcodes_h_l1181_c7_5c8f
t16_MUX_uxn_opcodes_h_l1181_c7_5c8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond,
t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue,
t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse,
t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f
result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f
result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f
result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66
BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_left,
BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_right,
BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_return_output);

-- n16_MUX_uxn_opcodes_h_l1184_c7_0fd0
n16_MUX_uxn_opcodes_h_l1184_c7_0fd0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond,
n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue,
n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse,
n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output);

-- t16_MUX_uxn_opcodes_h_l1184_c7_0fd0
t16_MUX_uxn_opcodes_h_l1184_c7_0fd0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond,
t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue,
t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse,
t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0
result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0
result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0
result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665
BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_left,
BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_right,
BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_return_output);

-- n16_MUX_uxn_opcodes_h_l1189_c7_3f94
n16_MUX_uxn_opcodes_h_l1189_c7_3f94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1189_c7_3f94_cond,
n16_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue,
n16_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse,
n16_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output);

-- t16_MUX_uxn_opcodes_h_l1189_c7_3f94
t16_MUX_uxn_opcodes_h_l1189_c7_3f94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1189_c7_3f94_cond,
t16_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue,
t16_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse,
t16_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94
result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_cond,
result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94
result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94
result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94
result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1190_c3_4260
BIN_OP_OR_uxn_opcodes_h_l1190_c3_4260 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1190_c3_4260_left,
BIN_OP_OR_uxn_opcodes_h_l1190_c3_4260_right,
BIN_OP_OR_uxn_opcodes_h_l1190_c3_4260_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96
BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_left,
BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_right,
BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_return_output);

-- n16_MUX_uxn_opcodes_h_l1193_c7_7e29
n16_MUX_uxn_opcodes_h_l1193_c7_7e29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1193_c7_7e29_cond,
n16_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue,
n16_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse,
n16_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29
result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_cond,
result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29
result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29
result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29
result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_left,
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_right,
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_return_output);

-- n16_MUX_uxn_opcodes_h_l1197_c7_4d89
n16_MUX_uxn_opcodes_h_l1197_c7_4d89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1197_c7_4d89_cond,
n16_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue,
n16_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse,
n16_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89
result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_cond,
result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1198_c3_e64e
BIN_OP_OR_uxn_opcodes_h_l1198_c3_e64e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1198_c3_e64e_left,
BIN_OP_OR_uxn_opcodes_h_l1198_c3_e64e_right,
BIN_OP_OR_uxn_opcodes_h_l1198_c3_e64e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1200_c30_69de
sp_relative_shift_uxn_opcodes_h_l1200_c30_69de : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_ins,
sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_x,
sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_y,
sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1203_c21_ded1
BIN_OP_EQ_uxn_opcodes_h_l1203_c21_ded1 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1203_c21_ded1_left,
BIN_OP_EQ_uxn_opcodes_h_l1203_c21_ded1_right,
BIN_OP_EQ_uxn_opcodes_h_l1203_c21_ded1_return_output);

-- MUX_uxn_opcodes_h_l1203_c21_1357
MUX_uxn_opcodes_h_l1203_c21_1357 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1203_c21_1357_cond,
MUX_uxn_opcodes_h_l1203_c21_1357_iftrue,
MUX_uxn_opcodes_h_l1203_c21_1357_iffalse,
MUX_uxn_opcodes_h_l1203_c21_1357_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387
BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387_left,
BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387_right,
BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1186_l1195_DUPLICATE_c1bb
CONST_SL_8_uint16_t_uxn_opcodes_h_l1186_l1195_DUPLICATE_c1bb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1186_l1195_DUPLICATE_c1bb_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1186_l1195_DUPLICATE_c1bb_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_return_output,
 n16_MUX_uxn_opcodes_h_l1174_c2_0180_return_output,
 t16_MUX_uxn_opcodes_h_l1174_c2_0180_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_return_output,
 n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output,
 t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_return_output,
 n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output,
 t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_return_output,
 n16_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output,
 t16_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1190_c3_4260_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_return_output,
 n16_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_return_output,
 n16_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1198_c3_e64e_return_output,
 sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1203_c21_ded1_return_output,
 MUX_uxn_opcodes_h_l1203_c21_1357_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1186_l1195_DUPLICATE_c1bb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1174_c2_0180_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1174_c2_0180_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1174_c2_0180_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1174_c2_0180_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1178_c3_e186 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1182_c3_6b73 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1187_c3_f2bc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1189_c7_3f94_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1189_c7_3f94_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1191_c3_47ef : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1190_c3_4260_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1190_c3_4260_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1190_c3_4260_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1193_c7_7e29_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4d89_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1202_c3_d645 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1198_c3_e64e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1198_c3_e64e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1198_c3_e64e_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1203_c21_1357_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c21_ded1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c21_ded1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c21_ded1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1203_c21_1357_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1203_c21_1357_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1203_c21_1357_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1206_c3_59d6 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1197_l1184_l1189_DUPLICATE_e1c8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1184_l1205_l1189_DUPLICATE_07fe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1184_l1205_l1189_DUPLICATE_36e8_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1193_l1181_l1197_l1184_l1205_l1189_DUPLICATE_5cf8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1198_l1185_l1190_l1194_DUPLICATE_f1f6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1186_l1195_DUPLICATE_c1bb_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1186_l1195_DUPLICATE_c1bb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1193_l1197_DUPLICATE_7bce_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1211_l1170_DUPLICATE_9920_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_opcodes_h_l1203_c21_1357_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1178_c3_e186 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1178_c3_e186;
     VAR_sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1206_c3_59d6 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1206_c3_59d6;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1202_c3_d645 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1202_c3_d645;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1182_c3_6b73 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1182_c3_6b73;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1203_c21_1357_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1191_c3_47ef := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1191_c3_47ef;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1187_c3_f2bc := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1187_c3_f2bc;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1198_c3_e64e_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c21_ded1_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1190_c3_4260_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1184_c11_2f66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_left;
     BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_return_output := BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1184_l1205_l1189_DUPLICATE_07fe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1184_l1205_l1189_DUPLICATE_07fe_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1184_l1205_l1189_DUPLICATE_36e8 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1184_l1205_l1189_DUPLICATE_36e8_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1181_c11_65d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1205_c11_8387] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387_left;
     BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387_return_output := BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1197_l1184_l1189_DUPLICATE_e1c8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1197_l1184_l1189_DUPLICATE_e1c8_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1193_l1197_DUPLICATE_7bce LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1193_l1197_DUPLICATE_7bce_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1197_c11_dd4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1200_c30_69de] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_ins;
     sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_x;
     sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_return_output := sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1189_c11_2665] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_left;
     BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_return_output := BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1174_c6_ba60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_left;
     BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_return_output := BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1198_l1185_l1190_l1194_DUPLICATE_f1f6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1198_l1185_l1190_l1194_DUPLICATE_f1f6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1193_l1181_l1197_l1184_l1205_l1189_DUPLICATE_5cf8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1193_l1181_l1197_l1184_l1205_l1189_DUPLICATE_5cf8_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1193_c11_de96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_left;
     BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_return_output := BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1174_c2_0180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1174_c2_0180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_ba60_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1181_c11_65d0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_2f66_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1189_c7_3f94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1189_c7_3f94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_2665_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1193_c7_7e29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1193_c11_de96_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4d89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_dd4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_8387_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1190_c3_4260_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1198_l1185_l1190_l1194_DUPLICATE_f1f6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1198_c3_e64e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1198_l1185_l1190_l1194_DUPLICATE_f1f6_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1186_l1195_DUPLICATE_c1bb_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1198_l1185_l1190_l1194_DUPLICATE_f1f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1184_l1205_l1189_DUPLICATE_36e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1184_l1205_l1189_DUPLICATE_36e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1184_l1205_l1189_DUPLICATE_36e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1184_l1205_l1189_DUPLICATE_36e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1184_l1205_l1189_DUPLICATE_36e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1184_l1205_l1189_DUPLICATE_36e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1193_l1181_l1197_l1184_l1205_l1189_DUPLICATE_5cf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1193_l1181_l1197_l1184_l1205_l1189_DUPLICATE_5cf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1193_l1181_l1197_l1184_l1205_l1189_DUPLICATE_5cf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1193_l1181_l1197_l1184_l1205_l1189_DUPLICATE_5cf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1193_l1181_l1197_l1184_l1205_l1189_DUPLICATE_5cf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1193_l1181_l1197_l1184_l1205_l1189_DUPLICATE_5cf8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1184_l1205_l1189_DUPLICATE_07fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1184_l1205_l1189_DUPLICATE_07fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1184_l1205_l1189_DUPLICATE_07fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1184_l1205_l1189_DUPLICATE_07fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1184_l1205_l1189_DUPLICATE_07fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1184_l1205_l1189_DUPLICATE_07fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1193_l1197_DUPLICATE_7bce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1193_l1197_DUPLICATE_7bce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1197_l1184_l1189_DUPLICATE_e1c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1197_l1184_l1189_DUPLICATE_e1c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1197_l1184_l1189_DUPLICATE_e1c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1197_l1184_l1189_DUPLICATE_e1c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1197_l1184_l1189_DUPLICATE_e1c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1174_l1193_l1181_l1197_l1184_l1189_DUPLICATE_e1c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1200_c30_69de_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1205_c7_ec6f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1186_l1195_DUPLICATE_c1bb LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1186_l1195_DUPLICATE_c1bb_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1186_l1195_DUPLICATE_c1bb_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1186_l1195_DUPLICATE_c1bb_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1186_l1195_DUPLICATE_c1bb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1190_c3_4260] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1190_c3_4260_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1190_c3_4260_left;
     BIN_OP_OR_uxn_opcodes_h_l1190_c3_4260_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1190_c3_4260_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1190_c3_4260_return_output := BIN_OP_OR_uxn_opcodes_h_l1190_c3_4260_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1205_c7_ec6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1205_c7_ec6f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1198_c3_e64e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1198_c3_e64e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1198_c3_e64e_left;
     BIN_OP_OR_uxn_opcodes_h_l1198_c3_e64e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1198_c3_e64e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1198_c3_e64e_return_output := BIN_OP_OR_uxn_opcodes_h_l1198_c3_e64e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c7_4d89] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1190_c3_4260_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c21_ded1_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1198_c3_e64e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1198_c3_e64e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1186_l1195_DUPLICATE_c1bb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1186_l1195_DUPLICATE_c1bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_ec6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_ec6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_ec6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1193_c7_7e29] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output;

     -- n16_MUX[uxn_opcodes_h_l1197_c7_4d89] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1197_c7_4d89_cond <= VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4d89_cond;
     n16_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue;
     n16_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output := n16_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c7_4d89] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c7_4d89] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1203_c21_ded1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1203_c21_ded1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c21_ded1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1203_c21_ded1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c21_ded1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c21_ded1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1203_c21_ded1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c7_4d89] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output;

     -- t16_MUX[uxn_opcodes_h_l1189_c7_3f94] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1189_c7_3f94_cond <= VAR_t16_MUX_uxn_opcodes_h_l1189_c7_3f94_cond;
     t16_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue;
     t16_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output := t16_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1203_c21_1357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c21_ded1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1193_c7_7e29] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output;

     -- n16_MUX[uxn_opcodes_h_l1193_c7_7e29] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1193_c7_7e29_cond <= VAR_n16_MUX_uxn_opcodes_h_l1193_c7_7e29_cond;
     n16_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue;
     n16_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output := n16_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output;

     -- t16_MUX[uxn_opcodes_h_l1184_c7_0fd0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond;
     t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue;
     t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output := t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1189_c7_3f94] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1193_c7_7e29] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output;

     -- MUX[uxn_opcodes_h_l1203_c21_1357] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1203_c21_1357_cond <= VAR_MUX_uxn_opcodes_h_l1203_c21_1357_cond;
     MUX_uxn_opcodes_h_l1203_c21_1357_iftrue <= VAR_MUX_uxn_opcodes_h_l1203_c21_1357_iftrue;
     MUX_uxn_opcodes_h_l1203_c21_1357_iffalse <= VAR_MUX_uxn_opcodes_h_l1203_c21_1357_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1203_c21_1357_return_output := MUX_uxn_opcodes_h_l1203_c21_1357_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1193_c7_7e29] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue := VAR_MUX_uxn_opcodes_h_l1203_c21_1357_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output;
     -- t16_MUX[uxn_opcodes_h_l1181_c7_5c8f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond;
     t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue;
     t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output := t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1189_c7_3f94] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1189_c7_3f94_cond <= VAR_n16_MUX_uxn_opcodes_h_l1189_c7_3f94_cond;
     n16_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue;
     n16_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output := n16_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1189_c7_3f94] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1189_c7_3f94] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1197_c7_4d89] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output := result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1189_c7_3f94] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1184_c7_0fd0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4d89_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1184_c7_0fd0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1193_c7_7e29] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output := result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output;

     -- t16_MUX[uxn_opcodes_h_l1174_c2_0180] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1174_c2_0180_cond <= VAR_t16_MUX_uxn_opcodes_h_l1174_c2_0180_cond;
     t16_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue;
     t16_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1174_c2_0180_return_output := t16_MUX_uxn_opcodes_h_l1174_c2_0180_return_output;

     -- n16_MUX[uxn_opcodes_h_l1184_c7_0fd0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond;
     n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue;
     n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output := n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1181_c7_5c8f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1184_c7_0fd0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1184_c7_0fd0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1193_c7_7e29_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1174_c2_0180_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1174_c2_0180] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1181_c7_5c8f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1181_c7_5c8f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond;
     n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue;
     n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output := n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1181_c7_5c8f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1189_c7_3f94] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output := result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1181_c7_5c8f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_3f94_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1174_c2_0180] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1174_c2_0180] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1174_c2_0180] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1184_c7_0fd0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1174_c2_0180] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1174_c2_0180_cond <= VAR_n16_MUX_uxn_opcodes_h_l1174_c2_0180_cond;
     n16_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue;
     n16_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1174_c2_0180_return_output := n16_MUX_uxn_opcodes_h_l1174_c2_0180_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1174_c2_0180_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1184_c7_0fd0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1181_c7_5c8f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1181_c7_5c8f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1174_c2_0180] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_return_output := result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1211_l1170_DUPLICATE_9920 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1211_l1170_DUPLICATE_9920_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_eae7(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_0180_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_0180_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_0180_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_0180_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_0180_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1211_l1170_DUPLICATE_9920_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1211_l1170_DUPLICATE_9920_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
