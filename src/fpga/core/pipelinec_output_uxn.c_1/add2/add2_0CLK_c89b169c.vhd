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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 112
entity add2_0CLK_c89b169c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_c89b169c;
architecture arch of add2_0CLK_c89b169c is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l903_c6_a20c]
signal BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l903_c2_85a4]
signal t16_MUX_uxn_opcodes_h_l903_c2_85a4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l903_c2_85a4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l903_c2_85a4]
signal tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l903_c2_85a4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l903_c2_85a4]
signal result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l903_c2_85a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l903_c2_85a4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l903_c2_85a4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l903_c2_85a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l903_c2_85a4]
signal n16_MUX_uxn_opcodes_h_l903_c2_85a4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l903_c2_85a4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l908_c11_fb22]
signal BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l908_c7_8082]
signal t16_MUX_uxn_opcodes_h_l908_c7_8082_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l908_c7_8082_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l908_c7_8082_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l908_c7_8082_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l908_c7_8082]
signal tmp16_MUX_uxn_opcodes_h_l908_c7_8082_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l908_c7_8082_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l908_c7_8082_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l908_c7_8082_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l908_c7_8082]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l908_c7_8082]
signal result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l908_c7_8082]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l908_c7_8082]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l908_c7_8082]
signal result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l908_c7_8082]
signal result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l908_c7_8082]
signal n16_MUX_uxn_opcodes_h_l908_c7_8082_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l908_c7_8082_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l908_c7_8082_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l908_c7_8082_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l911_c11_37c2]
signal BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l911_c7_fc9f]
signal t16_MUX_uxn_opcodes_h_l911_c7_fc9f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l911_c7_fc9f]
signal tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l911_c7_fc9f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l911_c7_fc9f]
signal result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l911_c7_fc9f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l911_c7_fc9f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l911_c7_fc9f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l911_c7_fc9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l911_c7_fc9f]
signal n16_MUX_uxn_opcodes_h_l911_c7_fc9f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l916_c11_a07c]
signal BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l916_c7_7a77]
signal t16_MUX_uxn_opcodes_h_l916_c7_7a77_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l916_c7_7a77_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l916_c7_7a77]
signal tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l916_c7_7a77]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l916_c7_7a77]
signal result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l916_c7_7a77]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l916_c7_7a77]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l916_c7_7a77]
signal result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l916_c7_7a77]
signal result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l916_c7_7a77]
signal n16_MUX_uxn_opcodes_h_l916_c7_7a77_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l916_c7_7a77_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l919_c11_1ea3]
signal BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l919_c7_d357]
signal t16_MUX_uxn_opcodes_h_l919_c7_d357_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l919_c7_d357_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l919_c7_d357_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l919_c7_d357_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l919_c7_d357]
signal tmp16_MUX_uxn_opcodes_h_l919_c7_d357_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l919_c7_d357_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l919_c7_d357_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l919_c7_d357_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l919_c7_d357]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l919_c7_d357]
signal result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l919_c7_d357]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l919_c7_d357]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l919_c7_d357]
signal result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l919_c7_d357]
signal result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l919_c7_d357]
signal n16_MUX_uxn_opcodes_h_l919_c7_d357_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l919_c7_d357_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l919_c7_d357_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l919_c7_d357_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l920_c3_2cff]
signal BIN_OP_OR_uxn_opcodes_h_l920_c3_2cff_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l920_c3_2cff_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l920_c3_2cff_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l923_c11_5e6c]
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l923_c7_294f]
signal tmp16_MUX_uxn_opcodes_h_l923_c7_294f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l923_c7_294f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l923_c7_294f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l923_c7_294f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l923_c7_294f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l923_c7_294f]
signal result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l923_c7_294f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l923_c7_294f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l923_c7_294f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l923_c7_294f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l923_c7_294f]
signal n16_MUX_uxn_opcodes_h_l923_c7_294f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l923_c7_294f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l923_c7_294f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l923_c7_294f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l926_c11_2ef7]
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l926_c7_82d5]
signal tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l926_c7_82d5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l926_c7_82d5]
signal result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l926_c7_82d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l926_c7_82d5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l926_c7_82d5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l926_c7_82d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l926_c7_82d5]
signal n16_MUX_uxn_opcodes_h_l926_c7_82d5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l926_c7_82d5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l931_c11_a696]
signal BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l931_c7_16bc]
signal tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l931_c7_16bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l931_c7_16bc]
signal result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l931_c7_16bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l931_c7_16bc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l931_c7_16bc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l931_c7_16bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l931_c7_16bc]
signal n16_MUX_uxn_opcodes_h_l931_c7_16bc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l931_c7_16bc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l934_c11_fcae]
signal BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l934_c7_266b]
signal tmp16_MUX_uxn_opcodes_h_l934_c7_266b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l934_c7_266b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l934_c7_266b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l934_c7_266b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l934_c7_266b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l934_c7_266b]
signal result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l934_c7_266b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l934_c7_266b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l934_c7_266b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l934_c7_266b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l934_c7_266b]
signal n16_MUX_uxn_opcodes_h_l934_c7_266b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l934_c7_266b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l934_c7_266b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l934_c7_266b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l935_c3_c4eb]
signal BIN_OP_OR_uxn_opcodes_h_l935_c3_c4eb_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l935_c3_c4eb_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l935_c3_c4eb_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l936_c11_fcd9]
signal BIN_OP_PLUS_uxn_opcodes_h_l936_c11_fcd9_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l936_c11_fcd9_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l936_c11_fcd9_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l938_c32_1ccf]
signal BIN_OP_AND_uxn_opcodes_h_l938_c32_1ccf_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l938_c32_1ccf_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l938_c32_1ccf_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l938_c32_5804]
signal BIN_OP_GT_uxn_opcodes_h_l938_c32_5804_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l938_c32_5804_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l938_c32_5804_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l938_c32_3186]
signal MUX_uxn_opcodes_h_l938_c32_3186_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l938_c32_3186_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l938_c32_3186_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l938_c32_3186_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l940_c11_9abe]
signal BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l940_c7_0f9a]
signal result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l940_c7_0f9a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l940_c7_0f9a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l940_c7_0f9a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l940_c7_0f9a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l946_c11_00b9]
signal BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l946_c7_12f3]
signal result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l946_c7_12f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l946_c7_12f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l946_c7_12f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l948_c34_fae7]
signal CONST_SR_8_uxn_opcodes_h_l948_c34_fae7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l948_c34_fae7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l950_c11_6632]
signal BIN_OP_EQ_uxn_opcodes_h_l950_c11_6632_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l950_c11_6632_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l950_c11_6632_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l950_c7_911a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l950_c7_911a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_84cb
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_84cb_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_84cb_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c
BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_left,
BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_right,
BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_return_output);

-- t16_MUX_uxn_opcodes_h_l903_c2_85a4
t16_MUX_uxn_opcodes_h_l903_c2_85a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l903_c2_85a4_cond,
t16_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue,
t16_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse,
t16_MUX_uxn_opcodes_h_l903_c2_85a4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l903_c2_85a4
tmp16_MUX_uxn_opcodes_h_l903_c2_85a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_cond,
tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue,
tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse,
tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4
result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_cond,
result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4
result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4
result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_return_output);

-- n16_MUX_uxn_opcodes_h_l903_c2_85a4
n16_MUX_uxn_opcodes_h_l903_c2_85a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l903_c2_85a4_cond,
n16_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue,
n16_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse,
n16_MUX_uxn_opcodes_h_l903_c2_85a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22
BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_left,
BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_right,
BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_return_output);

-- t16_MUX_uxn_opcodes_h_l908_c7_8082
t16_MUX_uxn_opcodes_h_l908_c7_8082 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l908_c7_8082_cond,
t16_MUX_uxn_opcodes_h_l908_c7_8082_iftrue,
t16_MUX_uxn_opcodes_h_l908_c7_8082_iffalse,
t16_MUX_uxn_opcodes_h_l908_c7_8082_return_output);

-- tmp16_MUX_uxn_opcodes_h_l908_c7_8082
tmp16_MUX_uxn_opcodes_h_l908_c7_8082 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l908_c7_8082_cond,
tmp16_MUX_uxn_opcodes_h_l908_c7_8082_iftrue,
tmp16_MUX_uxn_opcodes_h_l908_c7_8082_iffalse,
tmp16_MUX_uxn_opcodes_h_l908_c7_8082_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082
result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082
result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_cond,
result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082
result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082
result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082
result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_return_output);

-- n16_MUX_uxn_opcodes_h_l908_c7_8082
n16_MUX_uxn_opcodes_h_l908_c7_8082 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l908_c7_8082_cond,
n16_MUX_uxn_opcodes_h_l908_c7_8082_iftrue,
n16_MUX_uxn_opcodes_h_l908_c7_8082_iffalse,
n16_MUX_uxn_opcodes_h_l908_c7_8082_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2
BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_left,
BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_right,
BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_return_output);

-- t16_MUX_uxn_opcodes_h_l911_c7_fc9f
t16_MUX_uxn_opcodes_h_l911_c7_fc9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l911_c7_fc9f_cond,
t16_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue,
t16_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse,
t16_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f
tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_cond,
tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue,
tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse,
tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f
result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f
result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_cond,
result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f
result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f
result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f
result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output);

-- n16_MUX_uxn_opcodes_h_l911_c7_fc9f
n16_MUX_uxn_opcodes_h_l911_c7_fc9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l911_c7_fc9f_cond,
n16_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue,
n16_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse,
n16_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c
BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_left,
BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_right,
BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_return_output);

-- t16_MUX_uxn_opcodes_h_l916_c7_7a77
t16_MUX_uxn_opcodes_h_l916_c7_7a77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l916_c7_7a77_cond,
t16_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue,
t16_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse,
t16_MUX_uxn_opcodes_h_l916_c7_7a77_return_output);

-- tmp16_MUX_uxn_opcodes_h_l916_c7_7a77
tmp16_MUX_uxn_opcodes_h_l916_c7_7a77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_cond,
tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue,
tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse,
tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77
result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77
result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_cond,
result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_return_output);

-- n16_MUX_uxn_opcodes_h_l916_c7_7a77
n16_MUX_uxn_opcodes_h_l916_c7_7a77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l916_c7_7a77_cond,
n16_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue,
n16_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse,
n16_MUX_uxn_opcodes_h_l916_c7_7a77_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3
BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_left,
BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_right,
BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_return_output);

-- t16_MUX_uxn_opcodes_h_l919_c7_d357
t16_MUX_uxn_opcodes_h_l919_c7_d357 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l919_c7_d357_cond,
t16_MUX_uxn_opcodes_h_l919_c7_d357_iftrue,
t16_MUX_uxn_opcodes_h_l919_c7_d357_iffalse,
t16_MUX_uxn_opcodes_h_l919_c7_d357_return_output);

-- tmp16_MUX_uxn_opcodes_h_l919_c7_d357
tmp16_MUX_uxn_opcodes_h_l919_c7_d357 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l919_c7_d357_cond,
tmp16_MUX_uxn_opcodes_h_l919_c7_d357_iftrue,
tmp16_MUX_uxn_opcodes_h_l919_c7_d357_iffalse,
tmp16_MUX_uxn_opcodes_h_l919_c7_d357_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357
result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357
result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_cond,
result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357
result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357
result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357
result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_return_output);

-- n16_MUX_uxn_opcodes_h_l919_c7_d357
n16_MUX_uxn_opcodes_h_l919_c7_d357 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l919_c7_d357_cond,
n16_MUX_uxn_opcodes_h_l919_c7_d357_iftrue,
n16_MUX_uxn_opcodes_h_l919_c7_d357_iffalse,
n16_MUX_uxn_opcodes_h_l919_c7_d357_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l920_c3_2cff
BIN_OP_OR_uxn_opcodes_h_l920_c3_2cff : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l920_c3_2cff_left,
BIN_OP_OR_uxn_opcodes_h_l920_c3_2cff_right,
BIN_OP_OR_uxn_opcodes_h_l920_c3_2cff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c
BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_left,
BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_right,
BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l923_c7_294f
tmp16_MUX_uxn_opcodes_h_l923_c7_294f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l923_c7_294f_cond,
tmp16_MUX_uxn_opcodes_h_l923_c7_294f_iftrue,
tmp16_MUX_uxn_opcodes_h_l923_c7_294f_iffalse,
tmp16_MUX_uxn_opcodes_h_l923_c7_294f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f
result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_cond,
result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f
result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_return_output);

-- n16_MUX_uxn_opcodes_h_l923_c7_294f
n16_MUX_uxn_opcodes_h_l923_c7_294f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l923_c7_294f_cond,
n16_MUX_uxn_opcodes_h_l923_c7_294f_iftrue,
n16_MUX_uxn_opcodes_h_l923_c7_294f_iffalse,
n16_MUX_uxn_opcodes_h_l923_c7_294f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7
BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_left,
BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_right,
BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l926_c7_82d5
tmp16_MUX_uxn_opcodes_h_l926_c7_82d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_cond,
tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue,
tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse,
tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5
result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_cond,
result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_return_output);

-- n16_MUX_uxn_opcodes_h_l926_c7_82d5
n16_MUX_uxn_opcodes_h_l926_c7_82d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l926_c7_82d5_cond,
n16_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue,
n16_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse,
n16_MUX_uxn_opcodes_h_l926_c7_82d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696
BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_left,
BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_right,
BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_return_output);

-- tmp16_MUX_uxn_opcodes_h_l931_c7_16bc
tmp16_MUX_uxn_opcodes_h_l931_c7_16bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_cond,
tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue,
tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse,
tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc
result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_cond,
result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc
result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc
result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc
result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_return_output);

-- n16_MUX_uxn_opcodes_h_l931_c7_16bc
n16_MUX_uxn_opcodes_h_l931_c7_16bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l931_c7_16bc_cond,
n16_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue,
n16_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse,
n16_MUX_uxn_opcodes_h_l931_c7_16bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae
BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_left,
BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_right,
BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_return_output);

-- tmp16_MUX_uxn_opcodes_h_l934_c7_266b
tmp16_MUX_uxn_opcodes_h_l934_c7_266b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l934_c7_266b_cond,
tmp16_MUX_uxn_opcodes_h_l934_c7_266b_iftrue,
tmp16_MUX_uxn_opcodes_h_l934_c7_266b_iffalse,
tmp16_MUX_uxn_opcodes_h_l934_c7_266b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b
result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b
result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_cond,
result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b
result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b
result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b
result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_return_output);

-- n16_MUX_uxn_opcodes_h_l934_c7_266b
n16_MUX_uxn_opcodes_h_l934_c7_266b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l934_c7_266b_cond,
n16_MUX_uxn_opcodes_h_l934_c7_266b_iftrue,
n16_MUX_uxn_opcodes_h_l934_c7_266b_iffalse,
n16_MUX_uxn_opcodes_h_l934_c7_266b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l935_c3_c4eb
BIN_OP_OR_uxn_opcodes_h_l935_c3_c4eb : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l935_c3_c4eb_left,
BIN_OP_OR_uxn_opcodes_h_l935_c3_c4eb_right,
BIN_OP_OR_uxn_opcodes_h_l935_c3_c4eb_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l936_c11_fcd9
BIN_OP_PLUS_uxn_opcodes_h_l936_c11_fcd9 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l936_c11_fcd9_left,
BIN_OP_PLUS_uxn_opcodes_h_l936_c11_fcd9_right,
BIN_OP_PLUS_uxn_opcodes_h_l936_c11_fcd9_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l938_c32_1ccf
BIN_OP_AND_uxn_opcodes_h_l938_c32_1ccf : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l938_c32_1ccf_left,
BIN_OP_AND_uxn_opcodes_h_l938_c32_1ccf_right,
BIN_OP_AND_uxn_opcodes_h_l938_c32_1ccf_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l938_c32_5804
BIN_OP_GT_uxn_opcodes_h_l938_c32_5804 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l938_c32_5804_left,
BIN_OP_GT_uxn_opcodes_h_l938_c32_5804_right,
BIN_OP_GT_uxn_opcodes_h_l938_c32_5804_return_output);

-- MUX_uxn_opcodes_h_l938_c32_3186
MUX_uxn_opcodes_h_l938_c32_3186 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l938_c32_3186_cond,
MUX_uxn_opcodes_h_l938_c32_3186_iftrue,
MUX_uxn_opcodes_h_l938_c32_3186_iffalse,
MUX_uxn_opcodes_h_l938_c32_3186_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe
BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_left,
BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_right,
BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a
result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_cond,
result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a
result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9
BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9_left,
BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9_right,
BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3
result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_cond,
result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3
result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3
result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_return_output);

-- CONST_SR_8_uxn_opcodes_h_l948_c34_fae7
CONST_SR_8_uxn_opcodes_h_l948_c34_fae7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l948_c34_fae7_x,
CONST_SR_8_uxn_opcodes_h_l948_c34_fae7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l950_c11_6632
BIN_OP_EQ_uxn_opcodes_h_l950_c11_6632 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l950_c11_6632_left,
BIN_OP_EQ_uxn_opcodes_h_l950_c11_6632_right,
BIN_OP_EQ_uxn_opcodes_h_l950_c11_6632_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a
result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a
result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_84cb
CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_84cb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_84cb_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_84cb_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_return_output,
 t16_MUX_uxn_opcodes_h_l903_c2_85a4_return_output,
 tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_return_output,
 n16_MUX_uxn_opcodes_h_l903_c2_85a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_return_output,
 t16_MUX_uxn_opcodes_h_l908_c7_8082_return_output,
 tmp16_MUX_uxn_opcodes_h_l908_c7_8082_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_return_output,
 n16_MUX_uxn_opcodes_h_l908_c7_8082_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_return_output,
 t16_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output,
 tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output,
 n16_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_return_output,
 t16_MUX_uxn_opcodes_h_l916_c7_7a77_return_output,
 tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_return_output,
 n16_MUX_uxn_opcodes_h_l916_c7_7a77_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_return_output,
 t16_MUX_uxn_opcodes_h_l919_c7_d357_return_output,
 tmp16_MUX_uxn_opcodes_h_l919_c7_d357_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_return_output,
 n16_MUX_uxn_opcodes_h_l919_c7_d357_return_output,
 BIN_OP_OR_uxn_opcodes_h_l920_c3_2cff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_return_output,
 tmp16_MUX_uxn_opcodes_h_l923_c7_294f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_return_output,
 n16_MUX_uxn_opcodes_h_l923_c7_294f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_return_output,
 tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_return_output,
 n16_MUX_uxn_opcodes_h_l926_c7_82d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_return_output,
 tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_return_output,
 n16_MUX_uxn_opcodes_h_l931_c7_16bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_return_output,
 tmp16_MUX_uxn_opcodes_h_l934_c7_266b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_return_output,
 n16_MUX_uxn_opcodes_h_l934_c7_266b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l935_c3_c4eb_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l936_c11_fcd9_return_output,
 BIN_OP_AND_uxn_opcodes_h_l938_c32_1ccf_return_output,
 BIN_OP_GT_uxn_opcodes_h_l938_c32_5804_return_output,
 MUX_uxn_opcodes_h_l938_c32_3186_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_return_output,
 CONST_SR_8_uxn_opcodes_h_l948_c34_fae7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l950_c11_6632_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_84cb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l908_c7_8082_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l903_c2_85a4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l903_c2_85a4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_8082_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l905_c3_39bf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l908_c7_8082_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l903_c2_85a4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l903_c2_85a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l908_c7_8082_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l908_c7_8082_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l908_c7_8082_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_8082_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_8082_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_8082_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_0324 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l908_c7_8082_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l908_c7_8082_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l908_c7_8082_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l916_c7_7a77_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l911_c7_fc9f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_b8ad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l916_c7_7a77_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l911_c7_fc9f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l919_c7_d357_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l916_c7_7a77_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_d357_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l917_c3_ffb4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l919_c7_d357_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l916_c7_7a77_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l919_c7_d357_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l919_c7_d357_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l919_c7_d357_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_d357_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_d357_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_294f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_d357_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l921_c3_ce12 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l919_c7_d357_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l919_c7_d357_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l923_c7_294f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l919_c7_d357_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l920_c3_2cff_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l920_c3_2cff_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l920_c3_2cff_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_294f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_294f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_294f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_e5bc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l923_c7_294f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l923_c7_294f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_82d5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l923_c7_294f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l929_c3_800d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l931_c7_16bc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_82d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_266b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l932_c3_b1ab : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l934_c7_266b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l931_c7_16bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_266b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l936_c3_6e42 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_266b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_266b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l934_c7_266b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l934_c7_266b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l934_c7_266b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l935_c3_c4eb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l935_c3_c4eb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l935_c3_c4eb_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l936_c11_fcd9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l936_c11_fcd9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l936_c11_fcd9_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l938_c32_3186_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l938_c32_3186_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l938_c32_3186_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l938_c32_1ccf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l938_c32_1ccf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l938_c32_1ccf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l938_c32_5804_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l938_c32_5804_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l938_c32_5804_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l938_c32_3186_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l943_c3_d8d1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l944_c24_eb00_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l947_c3_3545 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l948_c34_fae7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l948_c34_fae7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l948_c24_1698_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_6632_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_6632_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_6632_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l919_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_74b1_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_4309_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l919_l916_l940_l911_l908_l931_l903_l926_l923_DUPLICATE_9ec7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_l950_DUPLICATE_28c6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l919_l946_l916_l940_l911_l934_l908_l931_l926_l923_l950_DUPLICATE_f5a6_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l912_l935_l927_l920_DUPLICATE_e597_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_84cb_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_84cb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l946_l934_DUPLICATE_3211_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l899_l955_DUPLICATE_85c8_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l938_c32_3186_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l947_c3_3545 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l947_c3_3545;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9_right := to_unsigned(10, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_e5bc := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_e5bc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l921_c3_ce12 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l921_c3_ce12;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l929_c3_800d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l929_c3_800d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_6632_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l943_c3_d8d1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l943_c3_d8d1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l905_c3_39bf := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l905_c3_39bf;
     VAR_MUX_uxn_opcodes_h_l938_c32_3186_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l932_c3_b1ab := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l932_c3_b1ab;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_b8ad := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_b8ad;
     VAR_BIN_OP_AND_uxn_opcodes_h_l938_c32_1ccf_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_0324 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_0324;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l917_c3_ffb4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l917_c3_ffb4;
     VAR_BIN_OP_GT_uxn_opcodes_h_l938_c32_5804_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_right := to_unsigned(2, 2);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l938_c32_1ccf_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l935_c3_c4eb_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l908_c7_8082_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l919_c7_d357_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l923_c7_294f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l934_c7_266b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_6632_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l920_c3_2cff_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l936_c11_fcd9_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l908_c7_8082_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l919_c7_d357_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l948_c34_fae7_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_8082_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_d357_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_294f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_266b_iffalse := tmp16;
     -- BIN_OP_AND[uxn_opcodes_h_l938_c32_1ccf] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l938_c32_1ccf_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l938_c32_1ccf_left;
     BIN_OP_AND_uxn_opcodes_h_l938_c32_1ccf_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l938_c32_1ccf_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l938_c32_1ccf_return_output := BIN_OP_AND_uxn_opcodes_h_l938_c32_1ccf_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l944_c24_eb00] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l944_c24_eb00_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l903_c6_a20c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_left;
     BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_return_output := BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l926_c11_2ef7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_left;
     BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_return_output := BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l919_c11_1ea3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_left;
     BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_return_output := BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l940_c11_9abe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_left;
     BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_return_output := BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l919_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_74b1 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l919_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_74b1_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l923_c11_5e6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l919_l946_l916_l940_l911_l934_l908_l931_l926_l923_l950_DUPLICATE_f5a6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l919_l946_l916_l940_l911_l934_l908_l931_l926_l923_l950_DUPLICATE_f5a6_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l948_c34_fae7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l948_c34_fae7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l948_c34_fae7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l948_c34_fae7_return_output := CONST_SR_8_uxn_opcodes_h_l948_c34_fae7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_4309 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_4309_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l916_c11_a07c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_left;
     BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_return_output := BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_l950_DUPLICATE_28c6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_l950_DUPLICATE_28c6_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l911_c11_37c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l934_c11_fcae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_left;
     BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_return_output := BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l950_c11_6632] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l950_c11_6632_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_6632_left;
     BIN_OP_EQ_uxn_opcodes_h_l950_c11_6632_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_6632_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_6632_return_output := BIN_OP_EQ_uxn_opcodes_h_l950_c11_6632_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l946_c11_00b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l919_l916_l940_l911_l908_l931_l903_l926_l923_DUPLICATE_9ec7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l919_l916_l940_l911_l908_l931_l903_l926_l923_DUPLICATE_9ec7_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l908_c11_fb22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_left;
     BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_return_output := BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l912_l935_l927_l920_DUPLICATE_e597 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l912_l935_l927_l920_DUPLICATE_e597_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l946_l934_DUPLICATE_3211 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l946_l934_DUPLICATE_3211_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l931_c11_a696] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_left;
     BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_return_output := BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l938_c32_5804_left := VAR_BIN_OP_AND_uxn_opcodes_h_l938_c32_1ccf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l903_c2_85a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l903_c2_85a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_a20c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l908_c7_8082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l908_c7_8082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_8082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_fb22_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l911_c7_fc9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l911_c7_fc9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_37c2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l916_c7_7a77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l916_c7_7a77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a07c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l919_c7_d357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l919_c7_d357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_d357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_1ea3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l923_c7_294f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_294f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_5e6c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_82d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ef7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l931_c7_16bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_a696_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l934_c7_266b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_266b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_fcae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_9abe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_00b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_6632_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_6632_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l920_c3_2cff_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l912_l935_l927_l920_DUPLICATE_e597_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l935_c3_c4eb_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l912_l935_l927_l920_DUPLICATE_e597_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_84cb_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l912_l935_l927_l920_DUPLICATE_e597_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l944_c24_eb00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l919_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_74b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l919_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_74b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l919_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_74b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l919_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_74b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l919_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_74b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l919_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_74b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l919_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_74b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l919_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_74b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l919_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_74b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l919_l946_l916_l940_l911_l934_l908_l931_l926_l923_l950_DUPLICATE_f5a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l919_l946_l916_l940_l911_l934_l908_l931_l926_l923_l950_DUPLICATE_f5a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l919_l946_l916_l940_l911_l934_l908_l931_l926_l923_l950_DUPLICATE_f5a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l919_l946_l916_l940_l911_l934_l908_l931_l926_l923_l950_DUPLICATE_f5a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l919_l946_l916_l940_l911_l934_l908_l931_l926_l923_l950_DUPLICATE_f5a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l919_l946_l916_l940_l911_l934_l908_l931_l926_l923_l950_DUPLICATE_f5a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l919_l946_l916_l940_l911_l934_l908_l931_l926_l923_l950_DUPLICATE_f5a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l919_l946_l916_l940_l911_l934_l908_l931_l926_l923_l950_DUPLICATE_f5a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l919_l946_l916_l940_l911_l934_l908_l931_l926_l923_l950_DUPLICATE_f5a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l919_l946_l916_l940_l911_l934_l908_l931_l926_l923_l950_DUPLICATE_f5a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l919_l946_l916_l940_l911_l934_l908_l931_l926_l923_l950_DUPLICATE_f5a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l919_l916_l940_l911_l908_l931_l903_l926_l923_DUPLICATE_9ec7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l919_l916_l940_l911_l908_l931_l903_l926_l923_DUPLICATE_9ec7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l919_l916_l940_l911_l908_l931_l903_l926_l923_DUPLICATE_9ec7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l919_l916_l940_l911_l908_l931_l903_l926_l923_DUPLICATE_9ec7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l919_l916_l940_l911_l908_l931_l903_l926_l923_DUPLICATE_9ec7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l919_l916_l940_l911_l908_l931_l903_l926_l923_DUPLICATE_9ec7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l919_l916_l940_l911_l908_l931_l903_l926_l923_DUPLICATE_9ec7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l919_l916_l940_l911_l908_l931_l903_l926_l923_DUPLICATE_9ec7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l919_l916_l940_l911_l908_l931_l903_l926_l923_DUPLICATE_9ec7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_l950_DUPLICATE_28c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_l950_DUPLICATE_28c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_l950_DUPLICATE_28c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_l950_DUPLICATE_28c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_l950_DUPLICATE_28c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_l950_DUPLICATE_28c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_l950_DUPLICATE_28c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_l950_DUPLICATE_28c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_l950_DUPLICATE_28c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_l950_DUPLICATE_28c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_l950_DUPLICATE_28c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l946_l934_DUPLICATE_3211_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l946_l934_DUPLICATE_3211_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_4309_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_4309_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_4309_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_4309_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_4309_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_4309_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_4309_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_4309_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_4309_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l919_l946_l916_l911_l934_l908_l931_l903_l926_l923_DUPLICATE_4309_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l950_c7_911a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l950_c7_911a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l938_c32_5804] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l938_c32_5804_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l938_c32_5804_left;
     BIN_OP_GT_uxn_opcodes_h_l938_c32_5804_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l938_c32_5804_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l938_c32_5804_return_output := BIN_OP_GT_uxn_opcodes_h_l938_c32_5804_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_84cb LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_84cb_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_84cb_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_84cb_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_84cb_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l948_c24_1698] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l948_c24_1698_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l948_c34_fae7_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l946_c7_12f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l935_c3_c4eb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l935_c3_c4eb_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l935_c3_c4eb_left;
     BIN_OP_OR_uxn_opcodes_h_l935_c3_c4eb_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l935_c3_c4eb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l935_c3_c4eb_return_output := BIN_OP_OR_uxn_opcodes_h_l935_c3_c4eb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l940_c7_0f9a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l920_c3_2cff] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l920_c3_2cff_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l920_c3_2cff_left;
     BIN_OP_OR_uxn_opcodes_h_l920_c3_2cff_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l920_c3_2cff_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l920_c3_2cff_return_output := BIN_OP_OR_uxn_opcodes_h_l920_c3_2cff_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l938_c32_3186_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l938_c32_5804_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l919_c7_d357_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l920_c3_2cff_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l936_c11_fcd9_right := VAR_BIN_OP_OR_uxn_opcodes_h_l935_c3_c4eb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l934_c7_266b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l935_c3_c4eb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l948_c24_1698_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_84cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_84cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_911a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_911a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_12f3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l946_c7_12f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l936_c11_fcd9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l936_c11_fcd9_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l936_c11_fcd9_left;
     BIN_OP_PLUS_uxn_opcodes_h_l936_c11_fcd9_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l936_c11_fcd9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l936_c11_fcd9_return_output := BIN_OP_PLUS_uxn_opcodes_h_l936_c11_fcd9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l940_c7_0f9a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l946_c7_12f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l934_c7_266b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l946_c7_12f3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_return_output := result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_return_output;

     -- MUX[uxn_opcodes_h_l938_c32_3186] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l938_c32_3186_cond <= VAR_MUX_uxn_opcodes_h_l938_c32_3186_cond;
     MUX_uxn_opcodes_h_l938_c32_3186_iftrue <= VAR_MUX_uxn_opcodes_h_l938_c32_3186_iftrue;
     MUX_uxn_opcodes_h_l938_c32_3186_iffalse <= VAR_MUX_uxn_opcodes_h_l938_c32_3186_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l938_c32_3186_return_output := MUX_uxn_opcodes_h_l938_c32_3186_return_output;

     -- t16_MUX[uxn_opcodes_h_l919_c7_d357] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l919_c7_d357_cond <= VAR_t16_MUX_uxn_opcodes_h_l919_c7_d357_cond;
     t16_MUX_uxn_opcodes_h_l919_c7_d357_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l919_c7_d357_iftrue;
     t16_MUX_uxn_opcodes_h_l919_c7_d357_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l919_c7_d357_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l919_c7_d357_return_output := t16_MUX_uxn_opcodes_h_l919_c7_d357_return_output;

     -- n16_MUX[uxn_opcodes_h_l934_c7_266b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l934_c7_266b_cond <= VAR_n16_MUX_uxn_opcodes_h_l934_c7_266b_cond;
     n16_MUX_uxn_opcodes_h_l934_c7_266b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l934_c7_266b_iftrue;
     n16_MUX_uxn_opcodes_h_l934_c7_266b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l934_c7_266b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l934_c7_266b_return_output := n16_MUX_uxn_opcodes_h_l934_c7_266b_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l936_c3_6e42 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l936_c11_fcd9_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_iftrue := VAR_MUX_uxn_opcodes_h_l938_c32_3186_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l934_c7_266b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_12f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_266b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_12f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_12f3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse := VAR_t16_MUX_uxn_opcodes_h_l919_c7_d357_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_266b_iftrue := VAR_tmp16_uxn_opcodes_h_l936_c3_6e42;
     -- t16_MUX[uxn_opcodes_h_l916_c7_7a77] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l916_c7_7a77_cond <= VAR_t16_MUX_uxn_opcodes_h_l916_c7_7a77_cond;
     t16_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue;
     t16_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l916_c7_7a77_return_output := t16_MUX_uxn_opcodes_h_l916_c7_7a77_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l934_c7_266b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l934_c7_266b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_266b_cond;
     tmp16_MUX_uxn_opcodes_h_l934_c7_266b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_266b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l934_c7_266b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_266b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_266b_return_output := tmp16_MUX_uxn_opcodes_h_l934_c7_266b_return_output;

     -- n16_MUX[uxn_opcodes_h_l931_c7_16bc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l931_c7_16bc_cond <= VAR_n16_MUX_uxn_opcodes_h_l931_c7_16bc_cond;
     n16_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue;
     n16_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l931_c7_16bc_return_output := n16_MUX_uxn_opcodes_h_l931_c7_16bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l934_c7_266b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l940_c7_0f9a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output := result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l934_c7_266b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l940_c7_0f9a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l931_c7_16bc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l940_c7_0f9a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l931_c7_16bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_16bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_266b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_266b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_0f9a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l916_c7_7a77_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_266b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l931_c7_16bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l934_c7_266b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_return_output;

     -- n16_MUX[uxn_opcodes_h_l926_c7_82d5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l926_c7_82d5_cond <= VAR_n16_MUX_uxn_opcodes_h_l926_c7_82d5_cond;
     n16_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue;
     n16_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_82d5_return_output := n16_MUX_uxn_opcodes_h_l926_c7_82d5_return_output;

     -- t16_MUX[uxn_opcodes_h_l911_c7_fc9f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l911_c7_fc9f_cond <= VAR_t16_MUX_uxn_opcodes_h_l911_c7_fc9f_cond;
     t16_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue;
     t16_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output := t16_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l934_c7_266b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l931_c7_16bc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_cond;
     tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_return_output := tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l931_c7_16bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l926_c7_82d5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l934_c7_266b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_return_output := result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l923_c7_294f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l926_c7_82d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_266b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_82d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_266b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_16bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_16bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_266b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l908_c7_8082_iffalse := VAR_t16_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_16bc_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l926_c7_82d5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_cond;
     tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_return_output := tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l931_c7_16bc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_return_output := result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l931_c7_16bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l923_c7_294f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_return_output;

     -- n16_MUX[uxn_opcodes_h_l923_c7_294f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l923_c7_294f_cond <= VAR_n16_MUX_uxn_opcodes_h_l923_c7_294f_cond;
     n16_MUX_uxn_opcodes_h_l923_c7_294f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l923_c7_294f_iftrue;
     n16_MUX_uxn_opcodes_h_l923_c7_294f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l923_c7_294f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l923_c7_294f_return_output := n16_MUX_uxn_opcodes_h_l923_c7_294f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l931_c7_16bc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l926_c7_82d5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_return_output;

     -- t16_MUX[uxn_opcodes_h_l908_c7_8082] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l908_c7_8082_cond <= VAR_t16_MUX_uxn_opcodes_h_l908_c7_8082_cond;
     t16_MUX_uxn_opcodes_h_l908_c7_8082_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l908_c7_8082_iftrue;
     t16_MUX_uxn_opcodes_h_l908_c7_8082_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l908_c7_8082_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l908_c7_8082_return_output := t16_MUX_uxn_opcodes_h_l908_c7_8082_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l926_c7_82d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l919_c7_d357_iffalse := VAR_n16_MUX_uxn_opcodes_h_l923_c7_294f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_16bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_294f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_16bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_82d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_82d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_16bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l908_c7_8082_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_294f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_82d5_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l919_c7_d357] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l926_c7_82d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l923_c7_294f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l926_c7_82d5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_return_output;

     -- n16_MUX[uxn_opcodes_h_l919_c7_d357] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l919_c7_d357_cond <= VAR_n16_MUX_uxn_opcodes_h_l919_c7_d357_cond;
     n16_MUX_uxn_opcodes_h_l919_c7_d357_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l919_c7_d357_iftrue;
     n16_MUX_uxn_opcodes_h_l919_c7_d357_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l919_c7_d357_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l919_c7_d357_return_output := n16_MUX_uxn_opcodes_h_l919_c7_d357_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l926_c7_82d5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_return_output := result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_return_output;

     -- t16_MUX[uxn_opcodes_h_l903_c2_85a4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l903_c2_85a4_cond <= VAR_t16_MUX_uxn_opcodes_h_l903_c2_85a4_cond;
     t16_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue;
     t16_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l903_c2_85a4_return_output := t16_MUX_uxn_opcodes_h_l903_c2_85a4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l923_c7_294f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l923_c7_294f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_294f_cond;
     tmp16_MUX_uxn_opcodes_h_l923_c7_294f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_294f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l923_c7_294f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_294f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_294f_return_output := tmp16_MUX_uxn_opcodes_h_l923_c7_294f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l923_c7_294f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse := VAR_n16_MUX_uxn_opcodes_h_l919_c7_d357_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_82d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_d357_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_82d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_294f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_294f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_82d5_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l903_c2_85a4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_d357_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_294f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l919_c7_d357] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l919_c7_d357] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l923_c7_294f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l916_c7_7a77] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l919_c7_d357] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l919_c7_d357_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_d357_cond;
     tmp16_MUX_uxn_opcodes_h_l919_c7_d357_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_d357_iftrue;
     tmp16_MUX_uxn_opcodes_h_l919_c7_d357_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_d357_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_d357_return_output := tmp16_MUX_uxn_opcodes_h_l919_c7_d357_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l923_c7_294f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_return_output := result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l923_c7_294f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_return_output;

     -- n16_MUX[uxn_opcodes_h_l916_c7_7a77] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l916_c7_7a77_cond <= VAR_n16_MUX_uxn_opcodes_h_l916_c7_7a77_cond;
     n16_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue;
     n16_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l916_c7_7a77_return_output := n16_MUX_uxn_opcodes_h_l916_c7_7a77_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l916_c7_7a77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_294f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_7a77_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_294f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_d357_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_d357_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_294f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_d357_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l919_c7_d357] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l916_c7_7a77] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l911_c7_fc9f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l919_c7_d357] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_cond;
     result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_return_output := result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l916_c7_7a77] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_cond;
     tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue;
     tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_return_output := tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_return_output;

     -- n16_MUX[uxn_opcodes_h_l911_c7_fc9f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l911_c7_fc9f_cond <= VAR_n16_MUX_uxn_opcodes_h_l911_c7_fc9f_cond;
     n16_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue;
     n16_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output := n16_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l919_c7_d357] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l916_c7_7a77] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l908_c7_8082_iffalse := VAR_n16_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_d357_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_d357_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_7a77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_7a77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_d357_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_7a77_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l908_c7_8082] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l911_c7_fc9f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l916_c7_7a77] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_cond;
     result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_return_output := result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l916_c7_7a77] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l916_c7_7a77] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_return_output;

     -- n16_MUX[uxn_opcodes_h_l908_c7_8082] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l908_c7_8082_cond <= VAR_n16_MUX_uxn_opcodes_h_l908_c7_8082_cond;
     n16_MUX_uxn_opcodes_h_l908_c7_8082_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l908_c7_8082_iftrue;
     n16_MUX_uxn_opcodes_h_l908_c7_8082_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l908_c7_8082_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l908_c7_8082_return_output := n16_MUX_uxn_opcodes_h_l908_c7_8082_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l911_c7_fc9f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l911_c7_fc9f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_cond;
     tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output := tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l908_c7_8082_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_7a77_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_8082_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_7a77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_7a77_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_8082_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l903_c2_85a4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_return_output;

     -- n16_MUX[uxn_opcodes_h_l903_c2_85a4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l903_c2_85a4_cond <= VAR_n16_MUX_uxn_opcodes_h_l903_c2_85a4_cond;
     n16_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue;
     n16_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l903_c2_85a4_return_output := n16_MUX_uxn_opcodes_h_l903_c2_85a4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l908_c7_8082] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l908_c7_8082] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l908_c7_8082_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_8082_cond;
     tmp16_MUX_uxn_opcodes_h_l908_c7_8082_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_8082_iftrue;
     tmp16_MUX_uxn_opcodes_h_l908_c7_8082_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_8082_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_8082_return_output := tmp16_MUX_uxn_opcodes_h_l908_c7_8082_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l911_c7_fc9f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output := result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l908_c7_8082] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l911_c7_fc9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l911_c7_fc9f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l903_c2_85a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_8082_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_8082_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_fc9f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_8082_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l908_c7_8082] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l908_c7_8082] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l903_c2_85a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l903_c2_85a4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_cond;
     tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_return_output := tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l908_c7_8082] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_cond;
     result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_return_output := result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l903_c2_85a4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_8082_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_8082_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_8082_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_85a4_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l903_c2_85a4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_return_output := result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l903_c2_85a4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l903_c2_85a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l899_l955_DUPLICATE_85c8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l899_l955_DUPLICATE_85c8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_85a4_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_85a4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_85a4_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_85a4_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_85a4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_85a4_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l899_l955_DUPLICATE_85c8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l899_l955_DUPLICATE_85c8_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
