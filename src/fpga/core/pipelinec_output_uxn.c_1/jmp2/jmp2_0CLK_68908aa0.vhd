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
-- Submodules: 62
entity jmp2_0CLK_68908aa0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp2_0CLK_68908aa0;
architecture arch of jmp2_0CLK_68908aa0 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l513_c6_63b0]
signal BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l513_c1_49a7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l513_c2_2597]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l513_c2_2597]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l513_c2_2597]
signal result_pc_MUX_uxn_opcodes_h_l513_c2_2597_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l513_c2_2597_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l513_c2_2597_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l513_c2_2597_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l513_c2_2597]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l513_c2_2597]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l513_c2_2597]
signal result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l513_c2_2597]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l513_c2_2597]
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l513_c2_2597]
signal t16_MUX_uxn_opcodes_h_l513_c2_2597_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l513_c2_2597_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l513_c2_2597_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l513_c2_2597_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l514_c3_fda4[uxn_opcodes_h_l514_c3_fda4]
signal printf_uxn_opcodes_h_l514_c3_fda4_uxn_opcodes_h_l514_c3_fda4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l520_c11_ba07]
signal BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l520_c7_9d61]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l520_c7_9d61]
signal result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l520_c7_9d61]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l520_c7_9d61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l520_c7_9d61]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l520_c7_9d61]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l520_c7_9d61]
signal result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l520_c7_9d61]
signal t16_MUX_uxn_opcodes_h_l520_c7_9d61_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l520_c7_9d61_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l523_c11_fede]
signal BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l523_c7_0b5e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l523_c7_0b5e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l523_c7_0b5e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l523_c7_0b5e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l523_c7_0b5e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l523_c7_0b5e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l523_c7_0b5e]
signal result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l523_c7_0b5e]
signal t16_MUX_uxn_opcodes_h_l523_c7_0b5e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l525_c3_5b59]
signal CONST_SL_8_uxn_opcodes_h_l525_c3_5b59_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l525_c3_5b59_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l528_c11_de45]
signal BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l528_c7_aed4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l528_c7_aed4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l528_c7_aed4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l528_c7_aed4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l528_c7_aed4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l528_c7_aed4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l528_c7_aed4]
signal result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l528_c7_aed4]
signal t16_MUX_uxn_opcodes_h_l528_c7_aed4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l528_c7_aed4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l531_c11_d84f]
signal BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l531_c7_9548]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l531_c7_9548]
signal result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l531_c7_9548]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l531_c7_9548]
signal result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l531_c7_9548]
signal result_pc_MUX_uxn_opcodes_h_l531_c7_9548_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l531_c7_9548_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l531_c7_9548_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l531_c7_9548_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l531_c7_9548]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l531_c7_9548]
signal t16_MUX_uxn_opcodes_h_l531_c7_9548_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l531_c7_9548_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l531_c7_9548_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l531_c7_9548_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l532_c3_ad2b]
signal BIN_OP_OR_uxn_opcodes_h_l532_c3_ad2b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l532_c3_ad2b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l532_c3_ad2b_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l535_c32_0a28]
signal BIN_OP_AND_uxn_opcodes_h_l535_c32_0a28_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l535_c32_0a28_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l535_c32_0a28_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l535_c32_5252]
signal BIN_OP_GT_uxn_opcodes_h_l535_c32_5252_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l535_c32_5252_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l535_c32_5252_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l535_c32_4f2f]
signal MUX_uxn_opcodes_h_l535_c32_4f2f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l535_c32_4f2f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l535_c32_4f2f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l535_c32_4f2f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l537_c11_a084]
signal BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l537_c7_51b2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l537_c7_51b2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l537_c7_51b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l537_c7_51b2]
signal result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l542_c11_8388]
signal BIN_OP_EQ_uxn_opcodes_h_l542_c11_8388_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l542_c11_8388_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l542_c11_8388_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l542_c7_2ddc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l542_c7_2ddc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_06ef( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.pc := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_read := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0
BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_left,
BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_right,
BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597
result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_return_output);

-- result_pc_MUX_uxn_opcodes_h_l513_c2_2597
result_pc_MUX_uxn_opcodes_h_l513_c2_2597 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l513_c2_2597_cond,
result_pc_MUX_uxn_opcodes_h_l513_c2_2597_iftrue,
result_pc_MUX_uxn_opcodes_h_l513_c2_2597_iffalse,
result_pc_MUX_uxn_opcodes_h_l513_c2_2597_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597
result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597
result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597
result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_return_output);

-- t16_MUX_uxn_opcodes_h_l513_c2_2597
t16_MUX_uxn_opcodes_h_l513_c2_2597 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l513_c2_2597_cond,
t16_MUX_uxn_opcodes_h_l513_c2_2597_iftrue,
t16_MUX_uxn_opcodes_h_l513_c2_2597_iffalse,
t16_MUX_uxn_opcodes_h_l513_c2_2597_return_output);

-- printf_uxn_opcodes_h_l514_c3_fda4_uxn_opcodes_h_l514_c3_fda4
printf_uxn_opcodes_h_l514_c3_fda4_uxn_opcodes_h_l514_c3_fda4 : entity work.printf_uxn_opcodes_h_l514_c3_fda4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l514_c3_fda4_uxn_opcodes_h_l514_c3_fda4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07
BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_left,
BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_right,
BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61
result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61
result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61
result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61
result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61
result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_return_output);

-- result_pc_MUX_uxn_opcodes_h_l520_c7_9d61
result_pc_MUX_uxn_opcodes_h_l520_c7_9d61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_cond,
result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue,
result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse,
result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_return_output);

-- t16_MUX_uxn_opcodes_h_l520_c7_9d61
t16_MUX_uxn_opcodes_h_l520_c7_9d61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l520_c7_9d61_cond,
t16_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue,
t16_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse,
t16_MUX_uxn_opcodes_h_l520_c7_9d61_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede
BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_left,
BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_right,
BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e
result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e
result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e
result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e
result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e
result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output);

-- result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e
result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_cond,
result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue,
result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse,
result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output);

-- t16_MUX_uxn_opcodes_h_l523_c7_0b5e
t16_MUX_uxn_opcodes_h_l523_c7_0b5e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l523_c7_0b5e_cond,
t16_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue,
t16_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse,
t16_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output);

-- CONST_SL_8_uxn_opcodes_h_l525_c3_5b59
CONST_SL_8_uxn_opcodes_h_l525_c3_5b59 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l525_c3_5b59_x,
CONST_SL_8_uxn_opcodes_h_l525_c3_5b59_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45
BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_left,
BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_right,
BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4
result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4
result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4
result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4
result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4
result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_return_output);

-- result_pc_MUX_uxn_opcodes_h_l528_c7_aed4
result_pc_MUX_uxn_opcodes_h_l528_c7_aed4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_cond,
result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue,
result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse,
result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_return_output);

-- t16_MUX_uxn_opcodes_h_l528_c7_aed4
t16_MUX_uxn_opcodes_h_l528_c7_aed4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l528_c7_aed4_cond,
t16_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue,
t16_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse,
t16_MUX_uxn_opcodes_h_l528_c7_aed4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f
BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_left,
BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_right,
BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548
result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548
result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548
result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548
result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_return_output);

-- result_pc_MUX_uxn_opcodes_h_l531_c7_9548
result_pc_MUX_uxn_opcodes_h_l531_c7_9548 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l531_c7_9548_cond,
result_pc_MUX_uxn_opcodes_h_l531_c7_9548_iftrue,
result_pc_MUX_uxn_opcodes_h_l531_c7_9548_iffalse,
result_pc_MUX_uxn_opcodes_h_l531_c7_9548_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548
result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_return_output);

-- t16_MUX_uxn_opcodes_h_l531_c7_9548
t16_MUX_uxn_opcodes_h_l531_c7_9548 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l531_c7_9548_cond,
t16_MUX_uxn_opcodes_h_l531_c7_9548_iftrue,
t16_MUX_uxn_opcodes_h_l531_c7_9548_iffalse,
t16_MUX_uxn_opcodes_h_l531_c7_9548_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l532_c3_ad2b
BIN_OP_OR_uxn_opcodes_h_l532_c3_ad2b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l532_c3_ad2b_left,
BIN_OP_OR_uxn_opcodes_h_l532_c3_ad2b_right,
BIN_OP_OR_uxn_opcodes_h_l532_c3_ad2b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l535_c32_0a28
BIN_OP_AND_uxn_opcodes_h_l535_c32_0a28 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l535_c32_0a28_left,
BIN_OP_AND_uxn_opcodes_h_l535_c32_0a28_right,
BIN_OP_AND_uxn_opcodes_h_l535_c32_0a28_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l535_c32_5252
BIN_OP_GT_uxn_opcodes_h_l535_c32_5252 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l535_c32_5252_left,
BIN_OP_GT_uxn_opcodes_h_l535_c32_5252_right,
BIN_OP_GT_uxn_opcodes_h_l535_c32_5252_return_output);

-- MUX_uxn_opcodes_h_l535_c32_4f2f
MUX_uxn_opcodes_h_l535_c32_4f2f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l535_c32_4f2f_cond,
MUX_uxn_opcodes_h_l535_c32_4f2f_iftrue,
MUX_uxn_opcodes_h_l535_c32_4f2f_iffalse,
MUX_uxn_opcodes_h_l535_c32_4f2f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084
BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084_left,
BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084_right,
BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2
result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_return_output);

-- result_pc_MUX_uxn_opcodes_h_l537_c7_51b2
result_pc_MUX_uxn_opcodes_h_l537_c7_51b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_cond,
result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue,
result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse,
result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l542_c11_8388
BIN_OP_EQ_uxn_opcodes_h_l542_c11_8388 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l542_c11_8388_left,
BIN_OP_EQ_uxn_opcodes_h_l542_c11_8388_right,
BIN_OP_EQ_uxn_opcodes_h_l542_c11_8388_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc
result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc
result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_return_output,
 result_pc_MUX_uxn_opcodes_h_l513_c2_2597_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_return_output,
 t16_MUX_uxn_opcodes_h_l513_c2_2597_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_return_output,
 result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_return_output,
 t16_MUX_uxn_opcodes_h_l520_c7_9d61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output,
 result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output,
 t16_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output,
 CONST_SL_8_uxn_opcodes_h_l525_c3_5b59_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_return_output,
 result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_return_output,
 t16_MUX_uxn_opcodes_h_l528_c7_aed4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_return_output,
 result_pc_MUX_uxn_opcodes_h_l531_c7_9548_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_return_output,
 t16_MUX_uxn_opcodes_h_l531_c7_9548_return_output,
 BIN_OP_OR_uxn_opcodes_h_l532_c3_ad2b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l535_c32_0a28_return_output,
 BIN_OP_GT_uxn_opcodes_h_l535_c32_5252_return_output,
 MUX_uxn_opcodes_h_l535_c32_4f2f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_return_output,
 result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l542_c11_8388_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l513_c2_2597_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l513_c2_2597_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l513_c2_2597_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l513_c2_2597_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l516_c3_6e80 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l513_c2_2597_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l513_c2_2597_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l513_c2_2597_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l520_c7_9d61_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l513_c2_2597_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l513_c2_2597_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l514_c3_fda4_uxn_opcodes_h_l514_c3_fda4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l521_c3_c0ff : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l520_c7_9d61_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l526_c3_f347 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l528_c7_aed4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l523_c7_0b5e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l525_c3_5b59_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l525_c3_5b59_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l529_c3_5096 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l528_c7_aed4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_9548_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l531_c7_9548_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l528_c7_aed4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_9548_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_9548_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_9548_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l531_c7_9548_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l531_c7_9548_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l531_c7_9548_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l532_c3_ad2b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l532_c3_ad2b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l532_c3_ad2b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l535_c32_4f2f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l535_c32_4f2f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l535_c32_4f2f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l535_c32_0a28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l535_c32_0a28_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l535_c32_0a28_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l535_c32_5252_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l535_c32_5252_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l535_c32_5252_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l535_c32_4f2f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_8388_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_8388_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_8388_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_l542_DUPLICATE_be5d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_DUPLICATE_c41e_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_l537_DUPLICATE_ba7a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l528_l523_l520_l513_l537_DUPLICATE_5c15_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l520_l531_l523_l528_DUPLICATE_7c91_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l531_l528_l523_l520_l542_l537_DUPLICATE_2631_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l524_l532_DUPLICATE_ca79_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_06ef_uxn_opcodes_h_l509_l547_DUPLICATE_510c_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l516_c3_6e80 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l516_c3_6e80;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_iffalse := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l535_c32_4f2f_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l526_c3_f347 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l526_c3_f347;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_8388_right := to_unsigned(6, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l535_c32_0a28_right := to_unsigned(128, 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l535_c32_4f2f_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l535_c32_5252_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l529_c3_5096 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l529_c3_5096;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l521_c3_c0ff := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l521_c3_c0ff;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l535_c32_0a28_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_8388_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l532_c3_ad2b_left := t16;
     VAR_result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l513_c2_2597_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l531_c7_9548_iffalse := t16;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l513_c2_2597] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l513_c2_2597_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_l537_DUPLICATE_ba7a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_l537_DUPLICATE_ba7a_return_output := result.pc;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_DUPLICATE_c41e LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_DUPLICATE_c41e_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l537_c11_a084] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084_left;
     BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084_return_output := BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l513_c6_63b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l520_c11_ba07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_left;
     BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_return_output := BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l528_c7_aed4] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l528_c7_aed4_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l528_l523_l520_l513_l537_DUPLICATE_5c15 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l528_l523_l520_l513_l537_DUPLICATE_5c15_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l531_c11_d84f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_left;
     BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_return_output := BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l531_l528_l523_l520_l542_l537_DUPLICATE_2631 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l531_l528_l523_l520_l542_l537_DUPLICATE_2631_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l535_c32_0a28] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l535_c32_0a28_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l535_c32_0a28_left;
     BIN_OP_AND_uxn_opcodes_h_l535_c32_0a28_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l535_c32_0a28_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l535_c32_0a28_return_output := BIN_OP_AND_uxn_opcodes_h_l535_c32_0a28_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l523_c11_fede] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_left;
     BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_return_output := BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_l542_DUPLICATE_be5d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_l542_DUPLICATE_be5d_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l520_l531_l523_l528_DUPLICATE_7c91 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l520_l531_l523_l528_DUPLICATE_7c91_return_output := result.is_stack_read;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l524_l532_DUPLICATE_ca79 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l524_l532_DUPLICATE_ca79_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l528_c11_de45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_left;
     BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_return_output := BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l542_c11_8388] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l542_c11_8388_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_8388_left;
     BIN_OP_EQ_uxn_opcodes_h_l542_c11_8388_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_8388_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_8388_return_output := BIN_OP_EQ_uxn_opcodes_h_l542_c11_8388_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l535_c32_5252_left := VAR_BIN_OP_AND_uxn_opcodes_h_l535_c32_0a28_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l513_c2_2597_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l513_c2_2597_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c6_63b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l520_c7_9d61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l520_c11_ba07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l523_c7_0b5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l523_c11_fede_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l528_c7_aed4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l528_c11_de45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_9548_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l531_c7_9548_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_d84f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_a084_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_8388_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_8388_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l532_c3_ad2b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l524_l532_DUPLICATE_ca79_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l525_c3_5b59_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l524_l532_DUPLICATE_ca79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_DUPLICATE_c41e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_DUPLICATE_c41e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_DUPLICATE_c41e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_DUPLICATE_c41e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_DUPLICATE_c41e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l513_c2_2597_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_l537_DUPLICATE_ba7a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_l537_DUPLICATE_ba7a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_l537_DUPLICATE_ba7a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_l537_DUPLICATE_ba7a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_9548_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_l537_DUPLICATE_ba7a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_l537_DUPLICATE_ba7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l531_l528_l523_l520_l542_l537_DUPLICATE_2631_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l531_l528_l523_l520_l542_l537_DUPLICATE_2631_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l531_l528_l523_l520_l542_l537_DUPLICATE_2631_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l531_l528_l523_l520_l542_l537_DUPLICATE_2631_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l531_l528_l523_l520_l542_l537_DUPLICATE_2631_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l531_l528_l523_l520_l542_l537_DUPLICATE_2631_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_l542_DUPLICATE_be5d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_l542_DUPLICATE_be5d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_l542_DUPLICATE_be5d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_l542_DUPLICATE_be5d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_l542_DUPLICATE_be5d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l531_l528_l523_l520_l513_l542_DUPLICATE_be5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l528_l523_l520_l513_l537_DUPLICATE_5c15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l528_l523_l520_l513_l537_DUPLICATE_5c15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l528_l523_l520_l513_l537_DUPLICATE_5c15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l528_l523_l520_l513_l537_DUPLICATE_5c15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l528_l523_l520_l513_l537_DUPLICATE_5c15_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l520_l531_l523_l528_DUPLICATE_7c91_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l520_l531_l523_l528_DUPLICATE_7c91_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l520_l531_l523_l528_DUPLICATE_7c91_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l520_l531_l523_l528_DUPLICATE_7c91_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l513_c2_2597_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l528_c7_aed4_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l513_c2_2597] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l528_c7_aed4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l535_c32_5252] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l535_c32_5252_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l535_c32_5252_left;
     BIN_OP_GT_uxn_opcodes_h_l535_c32_5252_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l535_c32_5252_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l535_c32_5252_return_output := BIN_OP_GT_uxn_opcodes_h_l535_c32_5252_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l537_c7_51b2] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_cond;
     result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue;
     result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_return_output := result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l537_c7_51b2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l525_c3_5b59] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l525_c3_5b59_x <= VAR_CONST_SL_8_uxn_opcodes_h_l525_c3_5b59_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l525_c3_5b59_return_output := CONST_SL_8_uxn_opcodes_h_l525_c3_5b59_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l532_c3_ad2b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l532_c3_ad2b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l532_c3_ad2b_left;
     BIN_OP_OR_uxn_opcodes_h_l532_c3_ad2b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l532_c3_ad2b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l532_c3_ad2b_return_output := BIN_OP_OR_uxn_opcodes_h_l532_c3_ad2b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l513_c1_49a7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l531_c7_9548] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l542_c7_2ddc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l542_c7_2ddc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l535_c32_4f2f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l535_c32_5252_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l531_c7_9548_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l532_c3_ad2b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l525_c3_5b59_return_output;
     VAR_printf_uxn_opcodes_h_l514_c3_fda4_uxn_opcodes_h_l514_c3_fda4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c1_49a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_2ddc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_2ddc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_51b2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_9548_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_9548_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l537_c7_51b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l528_c7_aed4_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l531_c7_9548] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l531_c7_9548_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_9548_cond;
     result_pc_MUX_uxn_opcodes_h_l531_c7_9548_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_9548_iftrue;
     result_pc_MUX_uxn_opcodes_h_l531_c7_9548_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_9548_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_9548_return_output := result_pc_MUX_uxn_opcodes_h_l531_c7_9548_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l528_c7_aed4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l537_c7_51b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l537_c7_51b2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l523_c7_0b5e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l531_c7_9548] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_return_output;

     -- t16_MUX[uxn_opcodes_h_l531_c7_9548] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l531_c7_9548_cond <= VAR_t16_MUX_uxn_opcodes_h_l531_c7_9548_cond;
     t16_MUX_uxn_opcodes_h_l531_c7_9548_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l531_c7_9548_iftrue;
     t16_MUX_uxn_opcodes_h_l531_c7_9548_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l531_c7_9548_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l531_c7_9548_return_output := t16_MUX_uxn_opcodes_h_l531_c7_9548_return_output;

     -- printf_uxn_opcodes_h_l514_c3_fda4[uxn_opcodes_h_l514_c3_fda4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l514_c3_fda4_uxn_opcodes_h_l514_c3_fda4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l514_c3_fda4_uxn_opcodes_h_l514_c3_fda4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l535_c32_4f2f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l535_c32_4f2f_cond <= VAR_MUX_uxn_opcodes_h_l535_c32_4f2f_cond;
     MUX_uxn_opcodes_h_l535_c32_4f2f_iftrue <= VAR_MUX_uxn_opcodes_h_l535_c32_4f2f_iftrue;
     MUX_uxn_opcodes_h_l535_c32_4f2f_iffalse <= VAR_MUX_uxn_opcodes_h_l535_c32_4f2f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l535_c32_4f2f_return_output := MUX_uxn_opcodes_h_l535_c32_4f2f_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_iftrue := VAR_MUX_uxn_opcodes_h_l535_c32_4f2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_51b2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l537_c7_51b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_9548_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l528_c7_aed4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_9548_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l531_c7_9548_return_output;
     -- t16_MUX[uxn_opcodes_h_l528_c7_aed4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l528_c7_aed4_cond <= VAR_t16_MUX_uxn_opcodes_h_l528_c7_aed4_cond;
     t16_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue;
     t16_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l528_c7_aed4_return_output := t16_MUX_uxn_opcodes_h_l528_c7_aed4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l523_c7_0b5e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l531_c7_9548] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l520_c7_9d61] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l528_c7_aed4] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_cond;
     result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue;
     result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_return_output := result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l531_c7_9548] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l531_c7_9548] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l528_c7_aed4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_9548_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_9548_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l528_c7_aed4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l528_c7_aed4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_9548_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l520_c7_9d61_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l528_c7_aed4_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l528_c7_aed4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l520_c7_9d61] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l523_c7_0b5e] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_cond;
     result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue;
     result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output := result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l513_c2_2597] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l528_c7_aed4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_return_output;

     -- t16_MUX[uxn_opcodes_h_l523_c7_0b5e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l523_c7_0b5e_cond <= VAR_t16_MUX_uxn_opcodes_h_l523_c7_0b5e_cond;
     t16_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue;
     t16_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output := t16_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l523_c7_0b5e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l528_c7_aed4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l528_c7_aed4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l528_c7_aed4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l520_c7_9d61_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l528_c7_aed4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse := VAR_t16_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l523_c7_0b5e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l523_c7_0b5e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l520_c7_9d61] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l523_c7_0b5e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l520_c7_9d61] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_cond;
     result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue;
     result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_return_output := result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l513_c2_2597] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_return_output;

     -- t16_MUX[uxn_opcodes_h_l520_c7_9d61] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l520_c7_9d61_cond <= VAR_t16_MUX_uxn_opcodes_h_l520_c7_9d61_cond;
     t16_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue;
     t16_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l520_c7_9d61_return_output := t16_MUX_uxn_opcodes_h_l520_c7_9d61_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l520_c7_9d61_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l513_c2_2597_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l520_c7_9d61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l523_c7_0b5e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l513_c2_2597_iffalse := VAR_t16_MUX_uxn_opcodes_h_l520_c7_9d61_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l513_c2_2597] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l520_c7_9d61] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l520_c7_9d61] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_return_output;

     -- t16_MUX[uxn_opcodes_h_l513_c2_2597] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l513_c2_2597_cond <= VAR_t16_MUX_uxn_opcodes_h_l513_c2_2597_cond;
     t16_MUX_uxn_opcodes_h_l513_c2_2597_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l513_c2_2597_iftrue;
     t16_MUX_uxn_opcodes_h_l513_c2_2597_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l513_c2_2597_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l513_c2_2597_return_output := t16_MUX_uxn_opcodes_h_l513_c2_2597_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l513_c2_2597] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l513_c2_2597_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l513_c2_2597_cond;
     result_pc_MUX_uxn_opcodes_h_l513_c2_2597_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l513_c2_2597_iftrue;
     result_pc_MUX_uxn_opcodes_h_l513_c2_2597_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l513_c2_2597_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l513_c2_2597_return_output := result_pc_MUX_uxn_opcodes_h_l513_c2_2597_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l520_c7_9d61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l520_c7_9d61_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l520_c7_9d61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l520_c7_9d61_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l513_c2_2597_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l513_c2_2597] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l513_c2_2597] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l513_c2_2597] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_06ef_uxn_opcodes_h_l509_l547_DUPLICATE_510c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_06ef_uxn_opcodes_h_l509_l547_DUPLICATE_510c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_06ef(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l513_c2_2597_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c2_2597_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l513_c2_2597_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l513_c2_2597_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l513_c2_2597_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l513_c2_2597_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l513_c2_2597_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c2_2597_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_06ef_uxn_opcodes_h_l509_l547_DUPLICATE_510c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_06ef_uxn_opcodes_h_l509_l547_DUPLICATE_510c_return_output;
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
