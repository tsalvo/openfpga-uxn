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
-- Submodules: 64
entity jmp2_0CLK_06911bbe is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp2_0CLK_06911bbe;
architecture arch of jmp2_0CLK_06911bbe is
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
-- BIN_OP_EQ[uxn_opcodes_h_l601_c6_dcb3]
signal BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l601_c1_349d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l601_c2_698f]
signal t16_MUX_uxn_opcodes_h_l601_c2_698f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l601_c2_698f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l601_c2_698f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l601_c2_698f_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l601_c2_698f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l601_c2_698f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l601_c2_698f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l601_c2_698f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l601_c2_698f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l601_c2_698f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l601_c2_698f]
signal result_pc_MUX_uxn_opcodes_h_l601_c2_698f_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l601_c2_698f_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l601_c2_698f_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l601_c2_698f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l601_c2_698f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l601_c2_698f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l602_c3_8e69[uxn_opcodes_h_l602_c3_8e69]
signal printf_uxn_opcodes_h_l602_c3_8e69_uxn_opcodes_h_l602_c3_8e69_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l609_c11_bfb3]
signal BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l609_c7_8cc2]
signal t16_MUX_uxn_opcodes_h_l609_c7_8cc2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l609_c7_8cc2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l609_c7_8cc2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l609_c7_8cc2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l609_c7_8cc2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l609_c7_8cc2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l609_c7_8cc2]
signal result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l609_c7_8cc2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l613_c11_c1f5]
signal BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l613_c7_5248]
signal t16_MUX_uxn_opcodes_h_l613_c7_5248_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l613_c7_5248_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l613_c7_5248_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l613_c7_5248_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l613_c7_5248]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l613_c7_5248]
signal result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l613_c7_5248]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l613_c7_5248]
signal result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l613_c7_5248]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l613_c7_5248]
signal result_pc_MUX_uxn_opcodes_h_l613_c7_5248_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l613_c7_5248_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l613_c7_5248_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l613_c7_5248_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l613_c7_5248]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_return_output : signed(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l615_c3_0060]
signal CONST_SL_8_uxn_opcodes_h_l615_c3_0060_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l615_c3_0060_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l619_c11_016a]
signal BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l619_c7_3c36]
signal t16_MUX_uxn_opcodes_h_l619_c7_3c36_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l619_c7_3c36_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l619_c7_3c36]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l619_c7_3c36]
signal result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l619_c7_3c36]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l619_c7_3c36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l619_c7_3c36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l619_c7_3c36]
signal result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l619_c7_3c36]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l623_c11_5b93]
signal BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l623_c7_6cdb]
signal t16_MUX_uxn_opcodes_h_l623_c7_6cdb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l623_c7_6cdb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l623_c7_6cdb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l623_c7_6cdb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l623_c7_6cdb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l623_c7_6cdb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l623_c7_6cdb]
signal result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l624_c3_ff6f]
signal BIN_OP_OR_uxn_opcodes_h_l624_c3_ff6f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l624_c3_ff6f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l624_c3_ff6f_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l627_c32_5c4b]
signal BIN_OP_AND_uxn_opcodes_h_l627_c32_5c4b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l627_c32_5c4b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l627_c32_5c4b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l627_c32_ef48]
signal BIN_OP_GT_uxn_opcodes_h_l627_c32_ef48_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l627_c32_ef48_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l627_c32_ef48_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l627_c32_bfd0]
signal MUX_uxn_opcodes_h_l627_c32_bfd0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l627_c32_bfd0_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l627_c32_bfd0_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l627_c32_bfd0_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l629_c11_e443]
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l629_c7_68ad]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l629_c7_68ad]
signal result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l629_c7_68ad]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l629_c7_68ad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l634_c11_56a8]
signal BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l634_c7_60ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l634_c7_60ed]
signal result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l634_c7_60ed]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_20e8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.pc := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3
BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_left,
BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_right,
BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_return_output);

-- t16_MUX_uxn_opcodes_h_l601_c2_698f
t16_MUX_uxn_opcodes_h_l601_c2_698f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l601_c2_698f_cond,
t16_MUX_uxn_opcodes_h_l601_c2_698f_iftrue,
t16_MUX_uxn_opcodes_h_l601_c2_698f_iffalse,
t16_MUX_uxn_opcodes_h_l601_c2_698f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f
result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f
result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f
result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f
result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f
result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f
result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_return_output);

-- result_pc_MUX_uxn_opcodes_h_l601_c2_698f
result_pc_MUX_uxn_opcodes_h_l601_c2_698f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l601_c2_698f_cond,
result_pc_MUX_uxn_opcodes_h_l601_c2_698f_iftrue,
result_pc_MUX_uxn_opcodes_h_l601_c2_698f_iffalse,
result_pc_MUX_uxn_opcodes_h_l601_c2_698f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_return_output);

-- printf_uxn_opcodes_h_l602_c3_8e69_uxn_opcodes_h_l602_c3_8e69
printf_uxn_opcodes_h_l602_c3_8e69_uxn_opcodes_h_l602_c3_8e69 : entity work.printf_uxn_opcodes_h_l602_c3_8e69_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l602_c3_8e69_uxn_opcodes_h_l602_c3_8e69_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3
BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_left,
BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_right,
BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_return_output);

-- t16_MUX_uxn_opcodes_h_l609_c7_8cc2
t16_MUX_uxn_opcodes_h_l609_c7_8cc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l609_c7_8cc2_cond,
t16_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue,
t16_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse,
t16_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2
result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2
result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output);

-- result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2
result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_cond,
result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue,
result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse,
result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5
BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_left,
BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_right,
BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_return_output);

-- t16_MUX_uxn_opcodes_h_l613_c7_5248
t16_MUX_uxn_opcodes_h_l613_c7_5248 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l613_c7_5248_cond,
t16_MUX_uxn_opcodes_h_l613_c7_5248_iftrue,
t16_MUX_uxn_opcodes_h_l613_c7_5248_iffalse,
t16_MUX_uxn_opcodes_h_l613_c7_5248_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248
result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248
result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248
result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248
result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_return_output);

-- result_pc_MUX_uxn_opcodes_h_l613_c7_5248
result_pc_MUX_uxn_opcodes_h_l613_c7_5248 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l613_c7_5248_cond,
result_pc_MUX_uxn_opcodes_h_l613_c7_5248_iftrue,
result_pc_MUX_uxn_opcodes_h_l613_c7_5248_iffalse,
result_pc_MUX_uxn_opcodes_h_l613_c7_5248_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248
result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_return_output);

-- CONST_SL_8_uxn_opcodes_h_l615_c3_0060
CONST_SL_8_uxn_opcodes_h_l615_c3_0060 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l615_c3_0060_x,
CONST_SL_8_uxn_opcodes_h_l615_c3_0060_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a
BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_left,
BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_right,
BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_return_output);

-- t16_MUX_uxn_opcodes_h_l619_c7_3c36
t16_MUX_uxn_opcodes_h_l619_c7_3c36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l619_c7_3c36_cond,
t16_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue,
t16_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse,
t16_MUX_uxn_opcodes_h_l619_c7_3c36_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36
result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36
result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36
result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36
result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_return_output);

-- result_pc_MUX_uxn_opcodes_h_l619_c7_3c36
result_pc_MUX_uxn_opcodes_h_l619_c7_3c36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_cond,
result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue,
result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse,
result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36
result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93
BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_left,
BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_right,
BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_return_output);

-- t16_MUX_uxn_opcodes_h_l623_c7_6cdb
t16_MUX_uxn_opcodes_h_l623_c7_6cdb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l623_c7_6cdb_cond,
t16_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue,
t16_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse,
t16_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb
result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb
result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb
result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output);

-- result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb
result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_cond,
result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue,
result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse,
result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l624_c3_ff6f
BIN_OP_OR_uxn_opcodes_h_l624_c3_ff6f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l624_c3_ff6f_left,
BIN_OP_OR_uxn_opcodes_h_l624_c3_ff6f_right,
BIN_OP_OR_uxn_opcodes_h_l624_c3_ff6f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l627_c32_5c4b
BIN_OP_AND_uxn_opcodes_h_l627_c32_5c4b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l627_c32_5c4b_left,
BIN_OP_AND_uxn_opcodes_h_l627_c32_5c4b_right,
BIN_OP_AND_uxn_opcodes_h_l627_c32_5c4b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l627_c32_ef48
BIN_OP_GT_uxn_opcodes_h_l627_c32_ef48 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l627_c32_ef48_left,
BIN_OP_GT_uxn_opcodes_h_l627_c32_ef48_right,
BIN_OP_GT_uxn_opcodes_h_l627_c32_ef48_return_output);

-- MUX_uxn_opcodes_h_l627_c32_bfd0
MUX_uxn_opcodes_h_l627_c32_bfd0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l627_c32_bfd0_cond,
MUX_uxn_opcodes_h_l627_c32_bfd0_iftrue,
MUX_uxn_opcodes_h_l627_c32_bfd0_iffalse,
MUX_uxn_opcodes_h_l627_c32_bfd0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443
BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443_left,
BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443_right,
BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_return_output);

-- result_pc_MUX_uxn_opcodes_h_l629_c7_68ad
result_pc_MUX_uxn_opcodes_h_l629_c7_68ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_cond,
result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue,
result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse,
result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8
BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8_left,
BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8_right,
BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed
result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_return_output);

-- result_pc_MUX_uxn_opcodes_h_l634_c7_60ed
result_pc_MUX_uxn_opcodes_h_l634_c7_60ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_cond,
result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_iftrue,
result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_iffalse,
result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed
result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_return_output,
 t16_MUX_uxn_opcodes_h_l601_c2_698f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_return_output,
 result_pc_MUX_uxn_opcodes_h_l601_c2_698f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_return_output,
 t16_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output,
 result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_return_output,
 t16_MUX_uxn_opcodes_h_l613_c7_5248_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_return_output,
 result_pc_MUX_uxn_opcodes_h_l613_c7_5248_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_return_output,
 CONST_SL_8_uxn_opcodes_h_l615_c3_0060_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_return_output,
 t16_MUX_uxn_opcodes_h_l619_c7_3c36_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_return_output,
 result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_return_output,
 t16_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output,
 result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l624_c3_ff6f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l627_c32_5c4b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l627_c32_ef48_return_output,
 MUX_uxn_opcodes_h_l627_c32_bfd0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_return_output,
 result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_return_output,
 result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l601_c2_698f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l601_c2_698f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l601_c2_698f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l601_c2_698f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l601_c2_698f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_698f_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_698f_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_698f_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_698f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l605_c3_52ff : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l601_c2_698f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l602_c3_8e69_uxn_opcodes_h_l602_c3_8e69_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l613_c7_5248_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l609_c7_8cc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l611_c3_f138 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_5248_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l613_c7_5248_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l613_c7_5248_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l619_c7_3c36_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l613_c7_5248_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l617_c3_eadf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_5248_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_5248_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_5248_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l615_c3_0060_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l615_c3_0060_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l619_c7_3c36_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l621_c3_4fc1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l619_c7_3c36_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c7_6cdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l623_c7_6cdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_ff6f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_ff6f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_ff6f_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l627_c32_bfd0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l627_c32_bfd0_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l627_c32_bfd0_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_5c4b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_5c4b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_5c4b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_ef48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_ef48_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_ef48_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l627_c32_bfd0_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l636_c3_c8dd : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_l634_DUPLICATE_8e24_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_c344_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_0c87_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_l634_DUPLICATE_5809_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l629_l623_l619_l613_l609_l634_DUPLICATE_5c44_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l624_l614_DUPLICATE_19c4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_20e8_uxn_opcodes_h_l640_l597_DUPLICATE_95da_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l621_c3_4fc1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l621_c3_4fc1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l611_c3_f138 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l611_c3_f138;
     VAR_MUX_uxn_opcodes_h_l627_c32_bfd0_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_iftrue := to_unsigned(0, 1);
     VAR_result_pc_uxn_opcodes_h_l636_c3_c8dd := resize(to_unsigned(0, 1), 16);
     VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_iftrue := VAR_result_pc_uxn_opcodes_h_l636_c3_c8dd;
     VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_5c4b_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l605_c3_52ff := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l605_c3_52ff;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_ef48_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l617_c3_eadf := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l617_c3_eadf;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l627_c32_bfd0_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_5c4b_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_ff6f_left := t16;
     VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l601_c2_698f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l629_l623_l619_l613_l609_l634_DUPLICATE_5c44 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l629_l623_l619_l613_l609_l634_DUPLICATE_5c44_return_output := result.is_opc_done;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l601_c2_698f] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l601_c2_698f_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l634_c11_56a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_0c87 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_0c87_return_output := result.sp_relative_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l601_c2_698f] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l601_c2_698f_return_output := result.is_stack_index_flipped;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l623_c7_6cdb] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l623_c7_6cdb_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l613_c11_c1f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l624_l614_DUPLICATE_19c4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l624_l614_DUPLICATE_19c4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l629_c11_e443] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443_left;
     BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443_return_output := BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l601_c6_dcb3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_left;
     BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_return_output := BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_c344 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_c344_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l609_c11_bfb3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_left;
     BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_return_output := BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l623_c11_5b93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_left;
     BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_return_output := BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_l634_DUPLICATE_5809 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_l634_DUPLICATE_5809_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l619_c11_016a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_left;
     BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_return_output := BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l627_c32_5c4b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l627_c32_5c4b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_5c4b_left;
     BIN_OP_AND_uxn_opcodes_h_l627_c32_5c4b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_5c4b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_5c4b_return_output := BIN_OP_AND_uxn_opcodes_h_l627_c32_5c4b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_l634_DUPLICATE_8e24 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_l634_DUPLICATE_8e24_return_output := result.is_pc_updated;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l619_c7_3c36] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l619_c7_3c36_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_ef48_left := VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_5c4b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_698f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l601_c2_698f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_dcb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l609_c7_8cc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_bfb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_5248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l613_c7_5248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_c1f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l619_c7_3c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_016a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l623_c7_6cdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_5b93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_e443_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_56a8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_ff6f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l624_l614_DUPLICATE_19c4_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l615_c3_0060_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l624_l614_DUPLICATE_19c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_0c87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_0c87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_0c87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_0c87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_0c87_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_698f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_l634_DUPLICATE_5809_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_l634_DUPLICATE_5809_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_5248_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_l634_DUPLICATE_5809_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_l634_DUPLICATE_5809_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_l634_DUPLICATE_5809_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_l634_DUPLICATE_5809_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l629_l623_l619_l613_l609_l634_DUPLICATE_5c44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l629_l623_l619_l613_l609_l634_DUPLICATE_5c44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l629_l623_l619_l613_l609_l634_DUPLICATE_5c44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l629_l623_l619_l613_l609_l634_DUPLICATE_5c44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l629_l623_l619_l613_l609_l634_DUPLICATE_5c44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l629_l623_l619_l613_l609_l634_DUPLICATE_5c44_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_l634_DUPLICATE_8e24_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_l634_DUPLICATE_8e24_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_l634_DUPLICATE_8e24_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_l634_DUPLICATE_8e24_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_l634_DUPLICATE_8e24_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_l634_DUPLICATE_8e24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_c344_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_c344_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_c344_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_c344_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_c344_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l601_c2_698f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l623_c7_6cdb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l601_c2_698f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l619_c7_3c36_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l619_c7_3c36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l624_c3_ff6f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l624_c3_ff6f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_ff6f_left;
     BIN_OP_OR_uxn_opcodes_h_l624_c3_ff6f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_ff6f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_ff6f_return_output := BIN_OP_OR_uxn_opcodes_h_l624_c3_ff6f_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l634_c7_60ed] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_cond;
     result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_iftrue;
     result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_return_output := result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l627_c32_ef48] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l627_c32_ef48_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_ef48_left;
     BIN_OP_GT_uxn_opcodes_h_l627_c32_ef48_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_ef48_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_ef48_return_output := BIN_OP_GT_uxn_opcodes_h_l627_c32_ef48_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l634_c7_60ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l623_c7_6cdb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l615_c3_0060] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l615_c3_0060_x <= VAR_CONST_SL_8_uxn_opcodes_h_l615_c3_0060_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l615_c3_0060_return_output := CONST_SL_8_uxn_opcodes_h_l615_c3_0060_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l601_c2_698f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l601_c1_349d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l634_c7_60ed] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l601_c2_698f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l629_c7_68ad] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l627_c32_bfd0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_ef48_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_ff6f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l613_c7_5248_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l615_c3_0060_return_output;
     VAR_printf_uxn_opcodes_h_l602_c3_8e69_uxn_opcodes_h_l602_c3_8e69_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_349d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_60ed_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_60ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_68ad_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_60ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_3c36_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l629_c7_68ad] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_cond;
     result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue;
     result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_return_output := result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l629_c7_68ad] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_return_output;

     -- printf_uxn_opcodes_h_l602_c3_8e69[uxn_opcodes_h_l602_c3_8e69] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l602_c3_8e69_uxn_opcodes_h_l602_c3_8e69_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l602_c3_8e69_uxn_opcodes_h_l602_c3_8e69_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l627_c32_bfd0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l627_c32_bfd0_cond <= VAR_MUX_uxn_opcodes_h_l627_c32_bfd0_cond;
     MUX_uxn_opcodes_h_l627_c32_bfd0_iftrue <= VAR_MUX_uxn_opcodes_h_l627_c32_bfd0_iftrue;
     MUX_uxn_opcodes_h_l627_c32_bfd0_iffalse <= VAR_MUX_uxn_opcodes_h_l627_c32_bfd0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l627_c32_bfd0_return_output := MUX_uxn_opcodes_h_l627_c32_bfd0_return_output;

     -- t16_MUX[uxn_opcodes_h_l623_c7_6cdb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l623_c7_6cdb_cond <= VAR_t16_MUX_uxn_opcodes_h_l623_c7_6cdb_cond;
     t16_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue;
     t16_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output := t16_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l629_c7_68ad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l613_c7_5248] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l623_c7_6cdb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l619_c7_3c36] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue := VAR_MUX_uxn_opcodes_h_l627_c32_bfd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_68ad_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_68ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_3c36_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_68ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_5248_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse := VAR_t16_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l613_c7_5248] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l623_c7_6cdb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l623_c7_6cdb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output;

     -- t16_MUX[uxn_opcodes_h_l619_c7_3c36] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l619_c7_3c36_cond <= VAR_t16_MUX_uxn_opcodes_h_l619_c7_3c36_cond;
     t16_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue;
     t16_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l619_c7_3c36_return_output := t16_MUX_uxn_opcodes_h_l619_c7_3c36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l609_c7_8cc2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l623_c7_6cdb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l619_c7_3c36] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l623_c7_6cdb] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_cond;
     result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_iftrue;
     result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output := result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_3c36_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_5248_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_6cdb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l613_c7_5248_iffalse := VAR_t16_MUX_uxn_opcodes_h_l619_c7_3c36_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l619_c7_3c36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l619_c7_3c36] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l609_c7_8cc2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l601_c2_698f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l613_c7_5248] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l619_c7_3c36] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_cond;
     result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue;
     result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_return_output := result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l619_c7_3c36] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_return_output;

     -- t16_MUX[uxn_opcodes_h_l613_c7_5248] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l613_c7_5248_cond <= VAR_t16_MUX_uxn_opcodes_h_l613_c7_5248_cond;
     t16_MUX_uxn_opcodes_h_l613_c7_5248_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l613_c7_5248_iftrue;
     t16_MUX_uxn_opcodes_h_l613_c7_5248_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l613_c7_5248_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l613_c7_5248_return_output := t16_MUX_uxn_opcodes_h_l613_c7_5248_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_3c36_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_3c36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_5248_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_5248_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_3c36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_3c36_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l613_c7_5248_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l609_c7_8cc2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l601_c2_698f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l613_c7_5248] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_return_output;

     -- t16_MUX[uxn_opcodes_h_l609_c7_8cc2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l609_c7_8cc2_cond <= VAR_t16_MUX_uxn_opcodes_h_l609_c7_8cc2_cond;
     t16_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue;
     t16_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output := t16_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l613_c7_5248] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l613_c7_5248] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l613_c7_5248_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_5248_cond;
     result_pc_MUX_uxn_opcodes_h_l613_c7_5248_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_5248_iftrue;
     result_pc_MUX_uxn_opcodes_h_l613_c7_5248_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_5248_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_5248_return_output := result_pc_MUX_uxn_opcodes_h_l613_c7_5248_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l613_c7_5248] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_5248_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_5248_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_5248_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_5248_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l601_c2_698f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output;
     -- t16_MUX[uxn_opcodes_h_l601_c2_698f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l601_c2_698f_cond <= VAR_t16_MUX_uxn_opcodes_h_l601_c2_698f_cond;
     t16_MUX_uxn_opcodes_h_l601_c2_698f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l601_c2_698f_iftrue;
     t16_MUX_uxn_opcodes_h_l601_c2_698f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l601_c2_698f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l601_c2_698f_return_output := t16_MUX_uxn_opcodes_h_l601_c2_698f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l601_c2_698f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l609_c7_8cc2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l609_c7_8cc2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l609_c7_8cc2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l609_c7_8cc2] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_cond;
     result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_iftrue;
     result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output := result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_698f_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8cc2_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l601_c2_698f_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l601_c2_698f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l601_c2_698f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l601_c2_698f] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l601_c2_698f_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_698f_cond;
     result_pc_MUX_uxn_opcodes_h_l601_c2_698f_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_698f_iftrue;
     result_pc_MUX_uxn_opcodes_h_l601_c2_698f_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_698f_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_698f_return_output := result_pc_MUX_uxn_opcodes_h_l601_c2_698f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l601_c2_698f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_20e8_uxn_opcodes_h_l640_l597_DUPLICATE_95da LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_20e8_uxn_opcodes_h_l640_l597_DUPLICATE_95da_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_20e8(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_698f_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_698f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_698f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_698f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_698f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_698f_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_698f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_698f_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_698f_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_20e8_uxn_opcodes_h_l640_l597_DUPLICATE_95da_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_20e8_uxn_opcodes_h_l640_l597_DUPLICATE_95da_return_output;
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
