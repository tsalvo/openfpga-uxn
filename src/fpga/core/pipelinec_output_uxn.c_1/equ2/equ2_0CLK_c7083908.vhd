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
-- Submodules: 96
entity equ2_0CLK_c7083908 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_c7083908;
architecture arch of equ2_0CLK_c7083908 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1291_c6_aaab]
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1291_c2_69bd]
signal t16_MUX_uxn_opcodes_h_l1291_c2_69bd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1291_c2_69bd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1291_c2_69bd]
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1291_c2_69bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1291_c2_69bd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1291_c2_69bd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1291_c2_69bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1291_c2_69bd]
signal n16_MUX_uxn_opcodes_h_l1291_c2_69bd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1296_c11_816f]
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1296_c7_aefe]
signal t16_MUX_uxn_opcodes_h_l1296_c7_aefe_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1296_c7_aefe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1296_c7_aefe]
signal result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1296_c7_aefe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1296_c7_aefe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1296_c7_aefe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1296_c7_aefe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1296_c7_aefe]
signal n16_MUX_uxn_opcodes_h_l1296_c7_aefe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1299_c11_bd71]
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1299_c7_2639]
signal t16_MUX_uxn_opcodes_h_l1299_c7_2639_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1299_c7_2639_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1299_c7_2639]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1299_c7_2639]
signal result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1299_c7_2639]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1299_c7_2639]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1299_c7_2639]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1299_c7_2639]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1299_c7_2639]
signal n16_MUX_uxn_opcodes_h_l1299_c7_2639_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1299_c7_2639_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1304_c11_5055]
signal BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1304_c7_681d]
signal t16_MUX_uxn_opcodes_h_l1304_c7_681d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1304_c7_681d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1304_c7_681d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1304_c7_681d]
signal result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1304_c7_681d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1304_c7_681d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1304_c7_681d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1304_c7_681d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1304_c7_681d]
signal n16_MUX_uxn_opcodes_h_l1304_c7_681d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1304_c7_681d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_e121]
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1307_c7_8d11]
signal t16_MUX_uxn_opcodes_h_l1307_c7_8d11_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_8d11]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1307_c7_8d11]
signal result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_8d11]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1307_c7_8d11]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_8d11]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_8d11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1307_c7_8d11]
signal n16_MUX_uxn_opcodes_h_l1307_c7_8d11_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1308_c3_f8f2]
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_f8f2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_f8f2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_f8f2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1311_c11_92e1]
signal BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1311_c7_788b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1311_c7_788b]
signal result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1311_c7_788b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1311_c7_788b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1311_c7_788b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1311_c7_788b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1311_c7_788b]
signal n16_MUX_uxn_opcodes_h_l1311_c7_788b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1311_c7_788b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1314_c11_8c74]
signal BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1314_c7_cb4f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1314_c7_cb4f]
signal result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1314_c7_cb4f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1314_c7_cb4f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1314_c7_cb4f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1314_c7_cb4f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1314_c7_cb4f]
signal n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1319_c11_ec1f]
signal BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1319_c7_50de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1319_c7_50de]
signal result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1319_c7_50de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1319_c7_50de]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1319_c7_50de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1319_c7_50de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1319_c7_50de]
signal n16_MUX_uxn_opcodes_h_l1319_c7_50de_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1319_c7_50de_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1322_c11_78ca]
signal BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1322_c7_453f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1322_c7_453f]
signal result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1322_c7_453f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1322_c7_453f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1322_c7_453f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1322_c7_453f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1322_c7_453f]
signal n16_MUX_uxn_opcodes_h_l1322_c7_453f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1322_c7_453f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1323_c3_c68b]
signal BIN_OP_OR_uxn_opcodes_h_l1323_c3_c68b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1323_c3_c68b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1323_c3_c68b_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1325_c32_be58]
signal BIN_OP_AND_uxn_opcodes_h_l1325_c32_be58_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1325_c32_be58_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1325_c32_be58_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1325_c32_da09]
signal BIN_OP_GT_uxn_opcodes_h_l1325_c32_da09_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1325_c32_da09_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1325_c32_da09_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1325_c32_a886]
signal MUX_uxn_opcodes_h_l1325_c32_a886_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1325_c32_a886_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1325_c32_a886_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1325_c32_a886_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1327_c11_17b7]
signal BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1327_c7_6d55]
signal result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1327_c7_6d55]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1327_c7_6d55]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1327_c7_6d55]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1327_c7_6d55]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1331_c24_eb0d]
signal BIN_OP_EQ_uxn_opcodes_h_l1331_c24_eb0d_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1331_c24_eb0d_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1331_c24_eb0d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1331_c24_11e0]
signal MUX_uxn_opcodes_h_l1331_c24_11e0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1331_c24_11e0_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1331_c24_11e0_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1331_c24_11e0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1333_c11_ad6d]
signal BIN_OP_EQ_uxn_opcodes_h_l1333_c11_ad6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1333_c11_ad6d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1333_c11_ad6d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1333_c7_d8ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1333_c7_d8ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1316_l1301_DUPLICATE_acb7
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1316_l1301_DUPLICATE_acb7_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1316_l1301_DUPLICATE_acb7_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab
BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_left,
BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_right,
BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_return_output);

-- t16_MUX_uxn_opcodes_h_l1291_c2_69bd
t16_MUX_uxn_opcodes_h_l1291_c2_69bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1291_c2_69bd_cond,
t16_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue,
t16_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse,
t16_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd
result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output);

-- n16_MUX_uxn_opcodes_h_l1291_c2_69bd
n16_MUX_uxn_opcodes_h_l1291_c2_69bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1291_c2_69bd_cond,
n16_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue,
n16_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse,
n16_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_left,
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_right,
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_return_output);

-- t16_MUX_uxn_opcodes_h_l1296_c7_aefe
t16_MUX_uxn_opcodes_h_l1296_c7_aefe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1296_c7_aefe_cond,
t16_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue,
t16_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse,
t16_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_cond,
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output);

-- n16_MUX_uxn_opcodes_h_l1296_c7_aefe
n16_MUX_uxn_opcodes_h_l1296_c7_aefe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1296_c7_aefe_cond,
n16_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue,
n16_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse,
n16_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_left,
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_right,
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_return_output);

-- t16_MUX_uxn_opcodes_h_l1299_c7_2639
t16_MUX_uxn_opcodes_h_l1299_c7_2639 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1299_c7_2639_cond,
t16_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue,
t16_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse,
t16_MUX_uxn_opcodes_h_l1299_c7_2639_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639
result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_cond,
result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639
result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_return_output);

-- n16_MUX_uxn_opcodes_h_l1299_c7_2639
n16_MUX_uxn_opcodes_h_l1299_c7_2639 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1299_c7_2639_cond,
n16_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue,
n16_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse,
n16_MUX_uxn_opcodes_h_l1299_c7_2639_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055
BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_left,
BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_right,
BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_return_output);

-- t16_MUX_uxn_opcodes_h_l1304_c7_681d
t16_MUX_uxn_opcodes_h_l1304_c7_681d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1304_c7_681d_cond,
t16_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue,
t16_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse,
t16_MUX_uxn_opcodes_h_l1304_c7_681d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d
result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_return_output);

-- n16_MUX_uxn_opcodes_h_l1304_c7_681d
n16_MUX_uxn_opcodes_h_l1304_c7_681d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1304_c7_681d_cond,
n16_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue,
n16_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse,
n16_MUX_uxn_opcodes_h_l1304_c7_681d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_left,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_right,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_return_output);

-- t16_MUX_uxn_opcodes_h_l1307_c7_8d11
t16_MUX_uxn_opcodes_h_l1307_c7_8d11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1307_c7_8d11_cond,
t16_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue,
t16_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse,
t16_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11
result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_cond,
result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output);

-- n16_MUX_uxn_opcodes_h_l1307_c7_8d11
n16_MUX_uxn_opcodes_h_l1307_c7_8d11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1307_c7_8d11_cond,
n16_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue,
n16_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse,
n16_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1308_c3_f8f2
BIN_OP_OR_uxn_opcodes_h_l1308_c3_f8f2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1308_c3_f8f2_left,
BIN_OP_OR_uxn_opcodes_h_l1308_c3_f8f2_right,
BIN_OP_OR_uxn_opcodes_h_l1308_c3_f8f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1
BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_left,
BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_right,
BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b
result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b
result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b
result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b
result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_return_output);

-- n16_MUX_uxn_opcodes_h_l1311_c7_788b
n16_MUX_uxn_opcodes_h_l1311_c7_788b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1311_c7_788b_cond,
n16_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue,
n16_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse,
n16_MUX_uxn_opcodes_h_l1311_c7_788b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74
BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_left,
BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_right,
BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f
result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f
result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f
result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f
result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output);

-- n16_MUX_uxn_opcodes_h_l1314_c7_cb4f
n16_MUX_uxn_opcodes_h_l1314_c7_cb4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond,
n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue,
n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse,
n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_left,
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_right,
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de
result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de
result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_cond,
result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de
result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_return_output);

-- n16_MUX_uxn_opcodes_h_l1319_c7_50de
n16_MUX_uxn_opcodes_h_l1319_c7_50de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1319_c7_50de_cond,
n16_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue,
n16_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse,
n16_MUX_uxn_opcodes_h_l1319_c7_50de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca
BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_left,
BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_right,
BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f
result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_return_output);

-- n16_MUX_uxn_opcodes_h_l1322_c7_453f
n16_MUX_uxn_opcodes_h_l1322_c7_453f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1322_c7_453f_cond,
n16_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue,
n16_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse,
n16_MUX_uxn_opcodes_h_l1322_c7_453f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1323_c3_c68b
BIN_OP_OR_uxn_opcodes_h_l1323_c3_c68b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1323_c3_c68b_left,
BIN_OP_OR_uxn_opcodes_h_l1323_c3_c68b_right,
BIN_OP_OR_uxn_opcodes_h_l1323_c3_c68b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1325_c32_be58
BIN_OP_AND_uxn_opcodes_h_l1325_c32_be58 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1325_c32_be58_left,
BIN_OP_AND_uxn_opcodes_h_l1325_c32_be58_right,
BIN_OP_AND_uxn_opcodes_h_l1325_c32_be58_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1325_c32_da09
BIN_OP_GT_uxn_opcodes_h_l1325_c32_da09 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1325_c32_da09_left,
BIN_OP_GT_uxn_opcodes_h_l1325_c32_da09_right,
BIN_OP_GT_uxn_opcodes_h_l1325_c32_da09_return_output);

-- MUX_uxn_opcodes_h_l1325_c32_a886
MUX_uxn_opcodes_h_l1325_c32_a886 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1325_c32_a886_cond,
MUX_uxn_opcodes_h_l1325_c32_a886_iftrue,
MUX_uxn_opcodes_h_l1325_c32_a886_iffalse,
MUX_uxn_opcodes_h_l1325_c32_a886_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7
BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_left,
BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_right,
BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55
result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_cond,
result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55
result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55
result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55
result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1331_c24_eb0d
BIN_OP_EQ_uxn_opcodes_h_l1331_c24_eb0d : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1331_c24_eb0d_left,
BIN_OP_EQ_uxn_opcodes_h_l1331_c24_eb0d_right,
BIN_OP_EQ_uxn_opcodes_h_l1331_c24_eb0d_return_output);

-- MUX_uxn_opcodes_h_l1331_c24_11e0
MUX_uxn_opcodes_h_l1331_c24_11e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1331_c24_11e0_cond,
MUX_uxn_opcodes_h_l1331_c24_11e0_iftrue,
MUX_uxn_opcodes_h_l1331_c24_11e0_iffalse,
MUX_uxn_opcodes_h_l1331_c24_11e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1333_c11_ad6d
BIN_OP_EQ_uxn_opcodes_h_l1333_c11_ad6d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1333_c11_ad6d_left,
BIN_OP_EQ_uxn_opcodes_h_l1333_c11_ad6d_right,
BIN_OP_EQ_uxn_opcodes_h_l1333_c11_ad6d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee
result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee
result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1316_l1301_DUPLICATE_acb7
CONST_SL_8_uint16_t_uxn_opcodes_h_l1316_l1301_DUPLICATE_acb7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1316_l1301_DUPLICATE_acb7_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1316_l1301_DUPLICATE_acb7_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_return_output,
 t16_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output,
 n16_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_return_output,
 t16_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output,
 n16_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_return_output,
 t16_MUX_uxn_opcodes_h_l1299_c7_2639_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_return_output,
 n16_MUX_uxn_opcodes_h_l1299_c7_2639_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_return_output,
 t16_MUX_uxn_opcodes_h_l1304_c7_681d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_return_output,
 n16_MUX_uxn_opcodes_h_l1304_c7_681d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_return_output,
 t16_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output,
 n16_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1308_c3_f8f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_return_output,
 n16_MUX_uxn_opcodes_h_l1311_c7_788b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output,
 n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_return_output,
 n16_MUX_uxn_opcodes_h_l1319_c7_50de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_return_output,
 n16_MUX_uxn_opcodes_h_l1322_c7_453f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1323_c3_c68b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1325_c32_be58_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1325_c32_da09_return_output,
 MUX_uxn_opcodes_h_l1325_c32_a886_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1331_c24_eb0d_return_output,
 MUX_uxn_opcodes_h_l1331_c24_11e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1333_c11_ad6d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1316_l1301_DUPLICATE_acb7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c2_69bd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1293_c3_01a5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c2_69bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_2639_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1296_c7_aefe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1297_c3_06e6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_2639_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_aefe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1304_c7_681d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_2639_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1302_c3_c8d2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1304_c7_681d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_2639_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1304_c7_681d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1305_c3_b02a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1304_c7_681d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8d11_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1309_c3_fdd4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1311_c7_788b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8d11_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_f8f2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_f8f2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_f8f2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1312_c3_4cc4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1311_c7_788b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1317_c3_46bb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1319_c7_50de_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_50ba : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1322_c7_453f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1319_c7_50de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1322_c7_453f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1323_c3_c68b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1323_c3_c68b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1323_c3_c68b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1325_c32_a886_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1325_c32_a886_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1325_c32_a886_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1325_c32_be58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1325_c32_be58_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1325_c32_be58_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1325_c32_da09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1325_c32_da09_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1325_c32_da09_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1325_c32_a886_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1330_c3_5932 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1331_c24_11e0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1331_c24_11e0_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1331_c24_11e0_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c24_eb0d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c24_eb0d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c24_eb0d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1331_c24_11e0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1333_c11_ad6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1333_c11_ad6d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1333_c11_ad6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_5083_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1322_l1296_l1319_l1291_DUPLICATE_0b3c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1296_l1319_l1291_DUPLICATE_ed4e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_b8ee_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1327_l1299_l1322_l1296_l1319_DUPLICATE_a374_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1300_l1323_l1315_l1308_DUPLICATE_e49f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1316_l1301_DUPLICATE_acb7_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1316_l1301_DUPLICATE_acb7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1327_l1322_DUPLICATE_76c9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1287_l1338_DUPLICATE_9b5c_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1325_c32_a886_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1331_c24_11e0_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1317_c3_46bb := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1317_c3_46bb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1325_c32_be58_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1293_c3_01a5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1293_c3_01a5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1305_c3_b02a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1305_c3_b02a;
     VAR_MUX_uxn_opcodes_h_l1331_c24_11e0_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1302_c3_c8d2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1302_c3_c8d2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1333_c11_ad6d_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1309_c3_fdd4 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1309_c3_fdd4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1312_c3_4cc4 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1312_c3_4cc4;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1297_c3_06e6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1297_c3_06e6;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1330_c3_5932 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1330_c3_5932;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1325_c32_da09_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_50ba := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_50ba;
     VAR_MUX_uxn_opcodes_h_l1325_c32_a886_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l1325_c32_be58_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c24_eb0d_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1323_c3_c68b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1333_c11_ad6d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c24_eb0d_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_f8f2_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1314_c11_8c74] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_left;
     BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_return_output := BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1327_l1299_l1322_l1296_l1319_DUPLICATE_a374 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1327_l1299_l1322_l1296_l1319_DUPLICATE_a374_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l1325_c32_be58] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1325_c32_be58_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1325_c32_be58_left;
     BIN_OP_AND_uxn_opcodes_h_l1325_c32_be58_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1325_c32_be58_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1325_c32_be58_return_output := BIN_OP_AND_uxn_opcodes_h_l1325_c32_be58_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_5083 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_5083_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_e121] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_left;
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_return_output := BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1331_c24_eb0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1331_c24_eb0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c24_eb0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1331_c24_eb0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c24_eb0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c24_eb0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1331_c24_eb0d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1291_c6_aaab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_left;
     BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_return_output := BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1296_c11_816f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1333_c11_ad6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1333_c11_ad6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1333_c11_ad6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1333_c11_ad6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1333_c11_ad6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1333_c11_ad6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1333_c11_ad6d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1327_l1322_DUPLICATE_76c9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1327_l1322_DUPLICATE_76c9_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1322_c11_78ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1304_c11_5055] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_left;
     BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_return_output := BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1300_l1323_l1315_l1308_DUPLICATE_e49f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1300_l1323_l1315_l1308_DUPLICATE_e49f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1319_c11_ec1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_b8ee LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_b8ee_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1311_c11_92e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1299_c11_bd71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_left;
     BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_return_output := BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1296_l1319_l1291_DUPLICATE_ed4e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1296_l1319_l1291_DUPLICATE_ed4e_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1327_c11_17b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1322_l1296_l1319_l1291_DUPLICATE_0b3c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1322_l1296_l1319_l1291_DUPLICATE_0b3c_return_output := result.stack_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1325_c32_da09_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1325_c32_be58_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1291_c2_69bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c2_69bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_aaab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_aefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1296_c7_aefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_816f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_2639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_2639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_bd71_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1304_c7_681d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1304_c7_681d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5055_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_e121_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1311_c7_788b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_92e1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8c74_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1319_c7_50de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_ec1f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1322_c7_453f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_78ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_17b7_return_output;
     VAR_MUX_uxn_opcodes_h_l1331_c24_11e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c24_eb0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1333_c11_ad6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1333_c11_ad6d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_f8f2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1300_l1323_l1315_l1308_DUPLICATE_e49f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1323_c3_c68b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1300_l1323_l1315_l1308_DUPLICATE_e49f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1316_l1301_DUPLICATE_acb7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1300_l1323_l1315_l1308_DUPLICATE_e49f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_5083_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_5083_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_5083_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_5083_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_5083_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_5083_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_5083_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_5083_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_5083_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1327_l1299_l1322_l1296_l1319_DUPLICATE_a374_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1327_l1299_l1322_l1296_l1319_DUPLICATE_a374_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1327_l1299_l1322_l1296_l1319_DUPLICATE_a374_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1327_l1299_l1322_l1296_l1319_DUPLICATE_a374_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1327_l1299_l1322_l1296_l1319_DUPLICATE_a374_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1327_l1299_l1322_l1296_l1319_DUPLICATE_a374_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1327_l1299_l1322_l1296_l1319_DUPLICATE_a374_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1327_l1299_l1322_l1296_l1319_DUPLICATE_a374_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1327_l1299_l1322_l1296_l1319_DUPLICATE_a374_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1327_l1299_l1322_l1296_l1319_DUPLICATE_a374_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1296_l1319_l1291_DUPLICATE_ed4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1296_l1319_l1291_DUPLICATE_ed4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1296_l1319_l1291_DUPLICATE_ed4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1296_l1319_l1291_DUPLICATE_ed4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1296_l1319_l1291_DUPLICATE_ed4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1296_l1319_l1291_DUPLICATE_ed4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1296_l1319_l1291_DUPLICATE_ed4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1296_l1319_l1291_DUPLICATE_ed4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1296_l1319_l1291_DUPLICATE_ed4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_b8ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_b8ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_b8ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_b8ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_b8ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_b8ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_b8ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_b8ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_b8ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1333_l1304_l1299_l1322_l1296_l1319_l1291_DUPLICATE_b8ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1327_l1322_DUPLICATE_76c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1327_l1322_DUPLICATE_76c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1322_l1296_l1319_l1291_DUPLICATE_0b3c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1322_l1296_l1319_l1291_DUPLICATE_0b3c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1322_l1296_l1319_l1291_DUPLICATE_0b3c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1322_l1296_l1319_l1291_DUPLICATE_0b3c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1322_l1296_l1319_l1291_DUPLICATE_0b3c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1322_l1296_l1319_l1291_DUPLICATE_0b3c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1322_l1296_l1319_l1291_DUPLICATE_0b3c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1322_l1296_l1319_l1291_DUPLICATE_0b3c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1322_l1296_l1319_l1291_DUPLICATE_0b3c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1314_l1311_l1307_l1304_l1327_l1299_l1322_l1296_l1319_l1291_DUPLICATE_0b3c_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1323_c3_c68b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1323_c3_c68b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1323_c3_c68b_left;
     BIN_OP_OR_uxn_opcodes_h_l1323_c3_c68b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1323_c3_c68b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1323_c3_c68b_return_output := BIN_OP_OR_uxn_opcodes_h_l1323_c3_c68b_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1325_c32_da09] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1325_c32_da09_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1325_c32_da09_left;
     BIN_OP_GT_uxn_opcodes_h_l1325_c32_da09_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1325_c32_da09_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1325_c32_da09_return_output := BIN_OP_GT_uxn_opcodes_h_l1325_c32_da09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1333_c7_d8ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1333_c7_d8ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1316_l1301_DUPLICATE_acb7 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1316_l1301_DUPLICATE_acb7_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1316_l1301_DUPLICATE_acb7_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1316_l1301_DUPLICATE_acb7_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1316_l1301_DUPLICATE_acb7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1327_c7_6d55] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1308_c3_f8f2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1308_c3_f8f2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_f8f2_left;
     BIN_OP_OR_uxn_opcodes_h_l1308_c3_f8f2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_f8f2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_f8f2_return_output := BIN_OP_OR_uxn_opcodes_h_l1308_c3_f8f2_return_output;

     -- MUX[uxn_opcodes_h_l1331_c24_11e0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1331_c24_11e0_cond <= VAR_MUX_uxn_opcodes_h_l1331_c24_11e0_cond;
     MUX_uxn_opcodes_h_l1331_c24_11e0_iftrue <= VAR_MUX_uxn_opcodes_h_l1331_c24_11e0_iftrue;
     MUX_uxn_opcodes_h_l1331_c24_11e0_iffalse <= VAR_MUX_uxn_opcodes_h_l1331_c24_11e0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1331_c24_11e0_return_output := MUX_uxn_opcodes_h_l1331_c24_11e0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1327_c7_6d55] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1325_c32_a886_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1325_c32_da09_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_f8f2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1323_c3_c68b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1316_l1301_DUPLICATE_acb7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1316_l1301_DUPLICATE_acb7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue := VAR_MUX_uxn_opcodes_h_l1331_c24_11e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_d8ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_d8ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1322_c7_453f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1327_c7_6d55] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output := result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1327_c7_6d55] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output;

     -- MUX[uxn_opcodes_h_l1325_c32_a886] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1325_c32_a886_cond <= VAR_MUX_uxn_opcodes_h_l1325_c32_a886_cond;
     MUX_uxn_opcodes_h_l1325_c32_a886_iftrue <= VAR_MUX_uxn_opcodes_h_l1325_c32_a886_iftrue;
     MUX_uxn_opcodes_h_l1325_c32_a886_iffalse <= VAR_MUX_uxn_opcodes_h_l1325_c32_a886_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1325_c32_a886_return_output := MUX_uxn_opcodes_h_l1325_c32_a886_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1322_c7_453f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1327_c7_6d55] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output;

     -- t16_MUX[uxn_opcodes_h_l1307_c7_8d11] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1307_c7_8d11_cond <= VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8d11_cond;
     t16_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue;
     t16_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output := t16_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output;

     -- n16_MUX[uxn_opcodes_h_l1322_c7_453f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1322_c7_453f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1322_c7_453f_cond;
     n16_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue;
     n16_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1322_c7_453f_return_output := n16_MUX_uxn_opcodes_h_l1322_c7_453f_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue := VAR_MUX_uxn_opcodes_h_l1325_c32_a886_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1322_c7_453f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_453f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_453f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_6d55_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1319_c7_50de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1322_c7_453f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1304_c7_681d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1304_c7_681d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1304_c7_681d_cond;
     t16_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue;
     t16_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1304_c7_681d_return_output := t16_MUX_uxn_opcodes_h_l1304_c7_681d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1322_c7_453f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1322_c7_453f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1322_c7_453f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1319_c7_50de] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1319_c7_50de_cond <= VAR_n16_MUX_uxn_opcodes_h_l1319_c7_50de_cond;
     n16_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue;
     n16_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1319_c7_50de_return_output := n16_MUX_uxn_opcodes_h_l1319_c7_50de_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1319_c7_50de] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1319_c7_50de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_453f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_50de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_453f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_453f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_50de_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_453f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1304_c7_681d_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1319_c7_50de] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_return_output := result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1319_c7_50de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1319_c7_50de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1319_c7_50de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1314_c7_cb4f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1299_c7_2639] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1299_c7_2639_cond <= VAR_t16_MUX_uxn_opcodes_h_l1299_c7_2639_cond;
     t16_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue;
     t16_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_2639_return_output := t16_MUX_uxn_opcodes_h_l1299_c7_2639_return_output;

     -- n16_MUX[uxn_opcodes_h_l1314_c7_cb4f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond;
     n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue;
     n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output := n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1314_c7_cb4f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_50de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_50de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_50de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_50de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1299_c7_2639_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1314_c7_cb4f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1296_c7_aefe] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1296_c7_aefe_cond <= VAR_t16_MUX_uxn_opcodes_h_l1296_c7_aefe_cond;
     t16_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue;
     t16_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output := t16_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1311_c7_788b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1314_c7_cb4f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1311_c7_788b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1311_c7_788b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1311_c7_788b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1311_c7_788b_cond;
     n16_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue;
     n16_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1311_c7_788b_return_output := n16_MUX_uxn_opcodes_h_l1311_c7_788b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1314_c7_cb4f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1314_c7_cb4f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1311_c7_788b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_788b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_788b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_cb4f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output;
     -- t16_MUX[uxn_opcodes_h_l1291_c2_69bd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1291_c2_69bd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1291_c2_69bd_cond;
     t16_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue;
     t16_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output := t16_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1311_c7_788b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1307_c7_8d11] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1307_c7_8d11_cond <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8d11_cond;
     n16_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue;
     n16_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output := n16_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1311_c7_788b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1307_c7_8d11] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1311_c7_788b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_8d11] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1311_c7_788b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_788b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_788b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_788b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_788b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_8d11] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output;

     -- n16_MUX[uxn_opcodes_h_l1304_c7_681d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1304_c7_681d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1304_c7_681d_cond;
     n16_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue;
     n16_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1304_c7_681d_return_output := n16_MUX_uxn_opcodes_h_l1304_c7_681d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_8d11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1304_c7_681d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1304_c7_681d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_8d11] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1307_c7_8d11] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output := result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1304_c7_681d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_681d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_681d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_8d11_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1299_c7_2639] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1299_c7_2639] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1304_c7_681d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1304_c7_681d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1304_c7_681d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1304_c7_681d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1299_c7_2639] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1299_c7_2639_cond <= VAR_n16_MUX_uxn_opcodes_h_l1299_c7_2639_cond;
     n16_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue;
     n16_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_2639_return_output := n16_MUX_uxn_opcodes_h_l1299_c7_2639_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1299_c7_2639_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_681d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_2639_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_681d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_681d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_2639_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_681d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1299_c7_2639] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1299_c7_2639] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_return_output := result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1299_c7_2639] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1296_c7_aefe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output;

     -- n16_MUX[uxn_opcodes_h_l1296_c7_aefe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1296_c7_aefe_cond <= VAR_n16_MUX_uxn_opcodes_h_l1296_c7_aefe_cond;
     n16_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue;
     n16_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output := n16_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1299_c7_2639] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1296_c7_aefe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_2639_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_2639_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_2639_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_2639_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1296_c7_aefe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output;

     -- n16_MUX[uxn_opcodes_h_l1291_c2_69bd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1291_c2_69bd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1291_c2_69bd_cond;
     n16_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue;
     n16_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output := n16_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1291_c2_69bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1296_c7_aefe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1296_c7_aefe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1296_c7_aefe] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output := result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1291_c2_69bd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_aefe_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1291_c2_69bd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1291_c2_69bd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1291_c2_69bd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1291_c2_69bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1287_l1338_DUPLICATE_9b5c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1287_l1338_DUPLICATE_9b5c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_69bd_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1287_l1338_DUPLICATE_9b5c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1287_l1338_DUPLICATE_9b5c_return_output;
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
