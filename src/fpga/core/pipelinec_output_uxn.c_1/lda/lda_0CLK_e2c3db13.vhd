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
-- Submodules: 57
entity lda_0CLK_e2c3db13 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda_0CLK_e2c3db13;
architecture arch of lda_0CLK_e2c3db13 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1368_c6_2388]
signal BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1368_c2_a798]
signal tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1368_c2_a798]
signal t16_MUX_uxn_opcodes_h_l1368_c2_a798_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1368_c2_a798_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1368_c2_a798]
signal result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1368_c2_a798]
signal result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1368_c2_a798]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1368_c2_a798]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1368_c2_a798]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1368_c2_a798]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1375_c11_644b]
signal BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1375_c7_c484]
signal tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1375_c7_c484]
signal t16_MUX_uxn_opcodes_h_l1375_c7_c484_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1375_c7_c484_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1375_c7_c484]
signal result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1375_c7_c484]
signal result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1375_c7_c484]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1375_c7_c484]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1375_c7_c484]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1375_c7_c484]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1378_c11_250e]
signal BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1378_c7_a272]
signal tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1378_c7_a272]
signal t16_MUX_uxn_opcodes_h_l1378_c7_a272_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1378_c7_a272_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1378_c7_a272]
signal result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1378_c7_a272]
signal result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1378_c7_a272]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1378_c7_a272]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1378_c7_a272]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1378_c7_a272]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1380_c3_cd4f]
signal CONST_SL_8_uxn_opcodes_h_l1380_c3_cd4f_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1380_c3_cd4f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1382_c11_3b65]
signal BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1382_c7_15b0]
signal tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1382_c7_15b0]
signal t16_MUX_uxn_opcodes_h_l1382_c7_15b0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1382_c7_15b0]
signal result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1382_c7_15b0]
signal result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1382_c7_15b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1382_c7_15b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1382_c7_15b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1382_c7_15b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1383_c3_5c90]
signal BIN_OP_OR_uxn_opcodes_h_l1383_c3_5c90_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1383_c3_5c90_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1383_c3_5c90_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1385_c30_c402]
signal sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1388_c11_8bc6]
signal BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1388_c7_d500]
signal tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1388_c7_d500]
signal result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1388_c7_d500]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1388_c7_d500]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1388_c7_d500]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1388_c7_d500]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1391_c11_c2cd]
signal BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1391_c7_055e]
signal tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1391_c7_055e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1391_c7_055e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1391_c7_055e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1391_c7_055e]
signal result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1397_c11_28c8]
signal BIN_OP_EQ_uxn_opcodes_h_l1397_c11_28c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1397_c11_28c8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1397_c11_28c8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1397_c7_b453]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1397_c7_b453]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_e78e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388
BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_left,
BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_right,
BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1368_c2_a798
tmp8_MUX_uxn_opcodes_h_l1368_c2_a798 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_cond,
tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue,
tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse,
tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_return_output);

-- t16_MUX_uxn_opcodes_h_l1368_c2_a798
t16_MUX_uxn_opcodes_h_l1368_c2_a798 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1368_c2_a798_cond,
t16_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue,
t16_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse,
t16_MUX_uxn_opcodes_h_l1368_c2_a798_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798
result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_cond,
result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798
result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_cond,
result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798
result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798
result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798
result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b
BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_left,
BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_right,
BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1375_c7_c484
tmp8_MUX_uxn_opcodes_h_l1375_c7_c484 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_cond,
tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue,
tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse,
tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_return_output);

-- t16_MUX_uxn_opcodes_h_l1375_c7_c484
t16_MUX_uxn_opcodes_h_l1375_c7_c484 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1375_c7_c484_cond,
t16_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue,
t16_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse,
t16_MUX_uxn_opcodes_h_l1375_c7_c484_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484
result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_cond,
result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484
result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_cond,
result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484
result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484
result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484
result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_left,
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_right,
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1378_c7_a272
tmp8_MUX_uxn_opcodes_h_l1378_c7_a272 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_cond,
tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue,
tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse,
tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_return_output);

-- t16_MUX_uxn_opcodes_h_l1378_c7_a272
t16_MUX_uxn_opcodes_h_l1378_c7_a272 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1378_c7_a272_cond,
t16_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue,
t16_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse,
t16_MUX_uxn_opcodes_h_l1378_c7_a272_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272
result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_cond,
result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272
result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_cond,
result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1380_c3_cd4f
CONST_SL_8_uxn_opcodes_h_l1380_c3_cd4f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1380_c3_cd4f_x,
CONST_SL_8_uxn_opcodes_h_l1380_c3_cd4f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65
BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_left,
BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_right,
BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0
tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_cond,
tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue,
tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse,
tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output);

-- t16_MUX_uxn_opcodes_h_l1382_c7_15b0
t16_MUX_uxn_opcodes_h_l1382_c7_15b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1382_c7_15b0_cond,
t16_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue,
t16_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse,
t16_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0
result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0
result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0
result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0
result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1383_c3_5c90
BIN_OP_OR_uxn_opcodes_h_l1383_c3_5c90 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1383_c3_5c90_left,
BIN_OP_OR_uxn_opcodes_h_l1383_c3_5c90_right,
BIN_OP_OR_uxn_opcodes_h_l1383_c3_5c90_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1385_c30_c402
sp_relative_shift_uxn_opcodes_h_l1385_c30_c402 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_ins,
sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_x,
sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_y,
sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_left,
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_right,
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1388_c7_d500
tmp8_MUX_uxn_opcodes_h_l1388_c7_d500 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_cond,
tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue,
tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse,
tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500
result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_cond,
result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd
BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_left,
BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_right,
BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1391_c7_055e
tmp8_MUX_uxn_opcodes_h_l1391_c7_055e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_cond,
tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue,
tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse,
tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e
result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e
result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e
result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1397_c11_28c8
BIN_OP_EQ_uxn_opcodes_h_l1397_c11_28c8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1397_c11_28c8_left,
BIN_OP_EQ_uxn_opcodes_h_l1397_c11_28c8_right,
BIN_OP_EQ_uxn_opcodes_h_l1397_c11_28c8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453
result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453
result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_return_output,
 tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_return_output,
 t16_MUX_uxn_opcodes_h_l1368_c2_a798_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_return_output,
 tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_return_output,
 t16_MUX_uxn_opcodes_h_l1375_c7_c484_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_return_output,
 tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_return_output,
 t16_MUX_uxn_opcodes_h_l1378_c7_a272_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_return_output,
 CONST_SL_8_uxn_opcodes_h_l1380_c3_cd4f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_return_output,
 tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output,
 t16_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1383_c3_5c90_return_output,
 sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_return_output,
 tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_return_output,
 tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1397_c11_28c8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1375_c7_c484_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1368_c2_a798_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1368_c2_a798_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1372_c3_5b65 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1378_c7_a272_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1375_c7_c484_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1376_c3_9936 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1378_c7_a272_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1380_c3_cd4f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1380_c3_cd4f_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1382_c7_15b0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1383_c3_5c90_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1383_c3_5c90_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1383_c3_5c90_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1389_c3_e195 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1394_c3_87e2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_28c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_28c8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_28c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1378_l1368_l1382_l1375_DUPLICATE_206e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1368_l1391_l1388_l1382_l1378_l1375_DUPLICATE_f455_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1368_l1397_l1388_l1382_l1378_l1375_DUPLICATE_c46d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1378_l1368_l1375_l1388_DUPLICATE_e7a9_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1397_l1391_l1388_l1382_l1378_l1375_DUPLICATE_6c08_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1379_l1383_DUPLICATE_9af0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1378_l1391_l1382_l1388_DUPLICATE_f21d_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e78e_uxn_opcodes_h_l1402_l1363_DUPLICATE_8e04_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1389_c3_e195 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1389_c3_e195;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1394_c3_87e2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1394_c3_87e2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1376_c3_9936 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1376_c3_9936;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_28c8_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1372_c3_5b65 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1372_c3_5b65;
     VAR_sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_right := to_unsigned(5, 3);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_28c8_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1383_c3_5c90_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1391_c11_c2cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1397_l1391_l1388_l1382_l1378_l1375_DUPLICATE_6c08 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1397_l1391_l1388_l1382_l1378_l1375_DUPLICATE_6c08_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1397_c11_28c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1397_c11_28c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_28c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1397_c11_28c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_28c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_28c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1397_c11_28c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1388_c11_8bc6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1382_c11_3b65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_left;
     BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_return_output := BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1378_l1368_l1375_l1388_DUPLICATE_e7a9 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1378_l1368_l1375_l1388_DUPLICATE_e7a9_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1378_c11_250e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1379_l1383_DUPLICATE_9af0 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1379_l1383_DUPLICATE_9af0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1375_c11_644b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1368_c6_2388] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_left;
     BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_return_output := BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1378_l1391_l1382_l1388_DUPLICATE_f21d LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1378_l1391_l1382_l1388_DUPLICATE_f21d_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1378_l1368_l1382_l1375_DUPLICATE_206e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1378_l1368_l1382_l1375_DUPLICATE_206e_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1368_l1397_l1388_l1382_l1378_l1375_DUPLICATE_c46d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1368_l1397_l1388_l1382_l1378_l1375_DUPLICATE_c46d_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1368_l1391_l1388_l1382_l1378_l1375_DUPLICATE_f455 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1368_l1391_l1388_l1382_l1378_l1375_DUPLICATE_f455_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1385_c30_c402] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_ins;
     sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_x;
     sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_return_output := sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1368_c2_a798_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c6_2388_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1375_c7_c484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_644b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1378_c7_a272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_250e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1382_c7_15b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_3b65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8bc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_c2cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_28c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_28c8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1383_c3_5c90_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1379_l1383_DUPLICATE_9af0_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1380_c3_cd4f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1379_l1383_DUPLICATE_9af0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1378_l1368_l1375_l1388_DUPLICATE_e7a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1378_l1368_l1375_l1388_DUPLICATE_e7a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1378_l1368_l1375_l1388_DUPLICATE_e7a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1378_l1368_l1375_l1388_DUPLICATE_e7a9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1378_l1368_l1382_l1375_DUPLICATE_206e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1378_l1368_l1382_l1375_DUPLICATE_206e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1378_l1368_l1382_l1375_DUPLICATE_206e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1378_l1368_l1382_l1375_DUPLICATE_206e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1397_l1391_l1388_l1382_l1378_l1375_DUPLICATE_6c08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1397_l1391_l1388_l1382_l1378_l1375_DUPLICATE_6c08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1397_l1391_l1388_l1382_l1378_l1375_DUPLICATE_6c08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1397_l1391_l1388_l1382_l1378_l1375_DUPLICATE_6c08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1397_l1391_l1388_l1382_l1378_l1375_DUPLICATE_6c08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1397_l1391_l1388_l1382_l1378_l1375_DUPLICATE_6c08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1368_l1397_l1388_l1382_l1378_l1375_DUPLICATE_c46d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1368_l1397_l1388_l1382_l1378_l1375_DUPLICATE_c46d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1368_l1397_l1388_l1382_l1378_l1375_DUPLICATE_c46d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1368_l1397_l1388_l1382_l1378_l1375_DUPLICATE_c46d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1368_l1397_l1388_l1382_l1378_l1375_DUPLICATE_c46d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1368_l1397_l1388_l1382_l1378_l1375_DUPLICATE_c46d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1378_l1391_l1382_l1388_DUPLICATE_f21d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1378_l1391_l1382_l1388_DUPLICATE_f21d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1378_l1391_l1382_l1388_DUPLICATE_f21d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1378_l1391_l1382_l1388_DUPLICATE_f21d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1368_l1391_l1388_l1382_l1378_l1375_DUPLICATE_f455_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1368_l1391_l1388_l1382_l1378_l1375_DUPLICATE_f455_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1368_l1391_l1388_l1382_l1378_l1375_DUPLICATE_f455_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1368_l1391_l1388_l1382_l1378_l1375_DUPLICATE_f455_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1368_l1391_l1388_l1382_l1378_l1375_DUPLICATE_f455_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1368_l1391_l1388_l1382_l1378_l1375_DUPLICATE_f455_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1385_c30_c402_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1391_c7_055e] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_cond;
     tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_return_output := tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1380_c3_cd4f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1380_c3_cd4f_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1380_c3_cd4f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1380_c3_cd4f_return_output := CONST_SL_8_uxn_opcodes_h_l1380_c3_cd4f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1383_c3_5c90] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1383_c3_5c90_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1383_c3_5c90_left;
     BIN_OP_OR_uxn_opcodes_h_l1383_c3_5c90_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1383_c3_5c90_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1383_c3_5c90_return_output := BIN_OP_OR_uxn_opcodes_h_l1383_c3_5c90_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1397_c7_b453] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1397_c7_b453] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1391_c7_055e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1388_c7_d500] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1391_c7_055e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1383_c3_5c90_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1383_c3_5c90_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1380_c3_cd4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_b453_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_b453_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_d500_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_055e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_055e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1391_c7_055e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1388_c7_d500] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1388_c7_d500] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_return_output := result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1391_c7_055e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1382_c7_15b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1382_c7_15b0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1382_c7_15b0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1382_c7_15b0_cond;
     t16_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue;
     t16_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output := t16_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1382_c7_15b0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1391_c7_055e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1388_c7_d500] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_cond;
     tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_return_output := tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_055e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_055e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_d500_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1388_c7_d500_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_d500_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1382_c7_15b0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1378_c7_a272] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1382_c7_15b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1378_c7_a272] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1378_c7_a272_cond <= VAR_t16_MUX_uxn_opcodes_h_l1378_c7_a272_cond;
     t16_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue;
     t16_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1378_c7_a272_return_output := t16_MUX_uxn_opcodes_h_l1378_c7_a272_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1388_c7_d500] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1388_c7_d500] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1378_c7_a272] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_return_output := result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1382_c7_15b0] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_cond;
     tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output := tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_d500_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_d500_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_a272_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1378_c7_a272_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1378_c7_a272_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1382_c7_15b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1375_c7_c484] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1375_c7_c484_cond <= VAR_t16_MUX_uxn_opcodes_h_l1375_c7_c484_cond;
     t16_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue;
     t16_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1375_c7_c484_return_output := t16_MUX_uxn_opcodes_h_l1375_c7_c484_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1382_c7_15b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1378_c7_a272] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_return_output := result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1378_c7_a272] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_cond;
     tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_return_output := tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1375_c7_c484] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1375_c7_c484] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_return_output := result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1378_c7_a272] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_15b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_c484_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_a272_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1375_c7_c484_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_a272_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1375_c7_c484_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_a272_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1375_c7_c484] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1375_c7_c484] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_cond;
     tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_return_output := tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1368_c2_a798] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1375_c7_c484] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_return_output := result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1378_c7_a272] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1368_c2_a798] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_return_output := result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1378_c7_a272] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_return_output;

     -- t16_MUX[uxn_opcodes_h_l1368_c2_a798] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1368_c2_a798_cond <= VAR_t16_MUX_uxn_opcodes_h_l1368_c2_a798_cond;
     t16_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue;
     t16_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1368_c2_a798_return_output := t16_MUX_uxn_opcodes_h_l1368_c2_a798_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_a272_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_a272_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_c484_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_c484_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1368_c2_a798_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1375_c7_c484_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1375_c7_c484] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1368_c2_a798] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1368_c2_a798] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_cond;
     tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_return_output := tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1368_c2_a798] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_return_output := result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1375_c7_c484] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_c484_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_c484_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1368_c2_a798_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1368_c2_a798] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1368_c2_a798] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e78e_uxn_opcodes_h_l1402_l1363_DUPLICATE_8e04 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e78e_uxn_opcodes_h_l1402_l1363_DUPLICATE_8e04_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e78e(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1368_c2_a798_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c2_a798_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c2_a798_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c2_a798_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c2_a798_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c2_a798_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e78e_uxn_opcodes_h_l1402_l1363_DUPLICATE_8e04_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e78e_uxn_opcodes_h_l1402_l1363_DUPLICATE_8e04_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
