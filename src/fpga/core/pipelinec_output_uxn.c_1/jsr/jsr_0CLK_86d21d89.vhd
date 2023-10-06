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
-- Submodules: 84
entity jsr_0CLK_86d21d89 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr_0CLK_86d21d89;
architecture arch of jsr_0CLK_86d21d89 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l829_c6_4e4a]
signal BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l829_c1_491e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l829_c2_9fed]
signal t8_MUX_uxn_opcodes_h_l829_c2_9fed_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l829_c2_9fed_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l829_c2_9fed]
signal result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l829_c2_9fed]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l829_c2_9fed]
signal result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l829_c2_9fed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l829_c2_9fed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l829_c2_9fed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l829_c2_9fed]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l829_c2_9fed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l829_c2_9fed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l829_c2_9fed]
signal result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l830_c3_8fee[uxn_opcodes_h_l830_c3_8fee]
signal printf_uxn_opcodes_h_l830_c3_8fee_uxn_opcodes_h_l830_c3_8fee_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l835_c11_9f6f]
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l835_c7_5309]
signal t8_MUX_uxn_opcodes_h_l835_c7_5309_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l835_c7_5309_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l835_c7_5309_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l835_c7_5309_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l835_c7_5309]
signal result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l835_c7_5309]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l835_c7_5309]
signal result_pc_MUX_uxn_opcodes_h_l835_c7_5309_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l835_c7_5309_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l835_c7_5309_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l835_c7_5309_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_5309]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_5309]
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_5309]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l835_c7_5309]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l835_c7_5309]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_5309]
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l835_c7_5309]
signal result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l838_c11_1f60]
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l838_c7_9e9c]
signal t8_MUX_uxn_opcodes_h_l838_c7_9e9c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l838_c7_9e9c]
signal result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l838_c7_9e9c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l838_c7_9e9c]
signal result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l838_c7_9e9c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l838_c7_9e9c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l838_c7_9e9c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l838_c7_9e9c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l838_c7_9e9c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l838_c7_9e9c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l838_c7_9e9c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l842_c32_b562]
signal BIN_OP_AND_uxn_opcodes_h_l842_c32_b562_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l842_c32_b562_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l842_c32_b562_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l842_c32_4202]
signal BIN_OP_GT_uxn_opcodes_h_l842_c32_4202_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l842_c32_4202_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l842_c32_4202_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l842_c32_ae08]
signal MUX_uxn_opcodes_h_l842_c32_ae08_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l842_c32_ae08_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l842_c32_ae08_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l842_c32_ae08_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l844_c11_747b]
signal BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l844_c7_01c6]
signal result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l844_c7_01c6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l844_c7_01c6]
signal result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l844_c7_01c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l844_c7_01c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l844_c7_01c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l844_c7_01c6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l844_c7_01c6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l844_c7_01c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l848_c11_b85e]
signal BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l848_c7_096b]
signal result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l848_c7_096b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l848_c7_096b]
signal result_pc_MUX_uxn_opcodes_h_l848_c7_096b_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l848_c7_096b_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l848_c7_096b_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l848_c7_096b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l848_c7_096b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l848_c7_096b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l848_c7_096b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l848_c7_096b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l848_c7_096b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l854_c11_051f]
signal BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l854_c7_37c1]
signal result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l854_c7_37c1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l854_c7_37c1]
signal result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l854_c7_37c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l854_c7_37c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l854_c7_37c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l854_c7_37c1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l856_c34_97f7]
signal CONST_SR_8_uxn_opcodes_h_l856_c34_97f7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l856_c34_97f7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l858_c11_3962]
signal BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l858_c7_51d1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l858_c7_51d1]
signal result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l858_c7_51d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l858_c7_51d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l858_c7_51d1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l861_c15_7e93]
signal BIN_OP_PLUS_uxn_opcodes_h_l861_c15_7e93_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l861_c15_7e93_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l861_c15_7e93_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l863_c11_d5c7]
signal BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l863_c7_21d1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l863_c7_21d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l863_c7_21d1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_355a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.pc := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_sp_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;
      base.is_stack_read := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a
BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_left,
BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_right,
BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_return_output);

-- t8_MUX_uxn_opcodes_h_l829_c2_9fed
t8_MUX_uxn_opcodes_h_l829_c2_9fed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l829_c2_9fed_cond,
t8_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue,
t8_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse,
t8_MUX_uxn_opcodes_h_l829_c2_9fed_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed
result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_cond,
result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_return_output);

-- result_pc_MUX_uxn_opcodes_h_l829_c2_9fed
result_pc_MUX_uxn_opcodes_h_l829_c2_9fed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_cond,
result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue,
result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse,
result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed
result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed
result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed
result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed
result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed
result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed
result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_return_output);

-- printf_uxn_opcodes_h_l830_c3_8fee_uxn_opcodes_h_l830_c3_8fee
printf_uxn_opcodes_h_l830_c3_8fee_uxn_opcodes_h_l830_c3_8fee : entity work.printf_uxn_opcodes_h_l830_c3_8fee_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l830_c3_8fee_uxn_opcodes_h_l830_c3_8fee_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f
BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_left,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_right,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_return_output);

-- t8_MUX_uxn_opcodes_h_l835_c7_5309
t8_MUX_uxn_opcodes_h_l835_c7_5309 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l835_c7_5309_cond,
t8_MUX_uxn_opcodes_h_l835_c7_5309_iftrue,
t8_MUX_uxn_opcodes_h_l835_c7_5309_iffalse,
t8_MUX_uxn_opcodes_h_l835_c7_5309_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309
result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_cond,
result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_return_output);

-- result_pc_MUX_uxn_opcodes_h_l835_c7_5309
result_pc_MUX_uxn_opcodes_h_l835_c7_5309 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l835_c7_5309_cond,
result_pc_MUX_uxn_opcodes_h_l835_c7_5309_iftrue,
result_pc_MUX_uxn_opcodes_h_l835_c7_5309_iffalse,
result_pc_MUX_uxn_opcodes_h_l835_c7_5309_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309
result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60
BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_left,
BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_right,
BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_return_output);

-- t8_MUX_uxn_opcodes_h_l838_c7_9e9c
t8_MUX_uxn_opcodes_h_l838_c7_9e9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l838_c7_9e9c_cond,
t8_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue,
t8_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse,
t8_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c
result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_cond,
result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c
result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_cond,
result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue,
result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse,
result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c
result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c
result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l842_c32_b562
BIN_OP_AND_uxn_opcodes_h_l842_c32_b562 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l842_c32_b562_left,
BIN_OP_AND_uxn_opcodes_h_l842_c32_b562_right,
BIN_OP_AND_uxn_opcodes_h_l842_c32_b562_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l842_c32_4202
BIN_OP_GT_uxn_opcodes_h_l842_c32_4202 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l842_c32_4202_left,
BIN_OP_GT_uxn_opcodes_h_l842_c32_4202_right,
BIN_OP_GT_uxn_opcodes_h_l842_c32_4202_return_output);

-- MUX_uxn_opcodes_h_l842_c32_ae08
MUX_uxn_opcodes_h_l842_c32_ae08 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l842_c32_ae08_cond,
MUX_uxn_opcodes_h_l842_c32_ae08_iftrue,
MUX_uxn_opcodes_h_l842_c32_ae08_iffalse,
MUX_uxn_opcodes_h_l842_c32_ae08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b
BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_left,
BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_right,
BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6
result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_cond,
result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_return_output);

-- result_pc_MUX_uxn_opcodes_h_l844_c7_01c6
result_pc_MUX_uxn_opcodes_h_l844_c7_01c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_cond,
result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue,
result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse,
result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6
result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6
result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6
result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6
result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e
BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_left,
BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_right,
BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b
result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_cond,
result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_return_output);

-- result_pc_MUX_uxn_opcodes_h_l848_c7_096b
result_pc_MUX_uxn_opcodes_h_l848_c7_096b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l848_c7_096b_cond,
result_pc_MUX_uxn_opcodes_h_l848_c7_096b_iftrue,
result_pc_MUX_uxn_opcodes_h_l848_c7_096b_iffalse,
result_pc_MUX_uxn_opcodes_h_l848_c7_096b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b
result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b
result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b
result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b
result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f
BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_left,
BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_right,
BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1
result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_cond,
result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_return_output);

-- result_pc_MUX_uxn_opcodes_h_l854_c7_37c1
result_pc_MUX_uxn_opcodes_h_l854_c7_37c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_cond,
result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue,
result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse,
result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l856_c34_97f7
CONST_SR_8_uxn_opcodes_h_l856_c34_97f7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l856_c34_97f7_x,
CONST_SR_8_uxn_opcodes_h_l856_c34_97f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962
BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_left,
BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_right,
BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_return_output);

-- result_pc_MUX_uxn_opcodes_h_l858_c7_51d1
result_pc_MUX_uxn_opcodes_h_l858_c7_51d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_cond,
result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue,
result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse,
result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1
result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1
result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1
result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l861_c15_7e93
BIN_OP_PLUS_uxn_opcodes_h_l861_c15_7e93 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l861_c15_7e93_left,
BIN_OP_PLUS_uxn_opcodes_h_l861_c15_7e93_right,
BIN_OP_PLUS_uxn_opcodes_h_l861_c15_7e93_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7
BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7_left,
BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7_right,
BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1
result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1
result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_return_output,
 t8_MUX_uxn_opcodes_h_l829_c2_9fed_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_return_output,
 result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_return_output,
 t8_MUX_uxn_opcodes_h_l835_c7_5309_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_return_output,
 result_pc_MUX_uxn_opcodes_h_l835_c7_5309_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_return_output,
 t8_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output,
 result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l842_c32_b562_return_output,
 BIN_OP_GT_uxn_opcodes_h_l842_c32_4202_return_output,
 MUX_uxn_opcodes_h_l842_c32_ae08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_return_output,
 result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_return_output,
 result_pc_MUX_uxn_opcodes_h_l848_c7_096b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_return_output,
 result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_return_output,
 CONST_SR_8_uxn_opcodes_h_l856_c34_97f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_return_output,
 result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l861_c15_7e93_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c7_5309_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l829_c2_9fed_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l829_c2_9fed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_5309_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_bbe2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l830_c3_8fee_uxn_opcodes_h_l830_c3_8fee_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c7_5309_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c7_5309_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c7_5309_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_5309_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_5309_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_5309_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l836_c3_c0ad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l838_c7_9e9c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l842_c32_ae08_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l842_c32_ae08_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l842_c32_ae08_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l842_c32_b562_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l842_c32_b562_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l842_c32_b562_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l842_c32_4202_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l842_c32_4202_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l842_c32_4202_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l842_c32_ae08_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l848_c7_096b_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l846_c3_cc2e : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l848_c7_096b_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l848_c7_096b_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l848_c7_096b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l851_c3_425a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l852_c24_4e14_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l855_c3_ab4a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l856_c34_97f7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l856_c34_97f7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l856_c24_78ad_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l861_c3_8afd : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l861_c15_7e93_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l861_c20_4ca0_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l861_c15_7e93_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l861_c15_7e93_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l844_l838_l835_l829_l854_DUPLICATE_5a9f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l838_l835_l863_l829_l858_l854_l848_DUPLICATE_bd95_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l844_l838_l835_l829_l858_l854_l848_DUPLICATE_dda3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l829_l844_l835_DUPLICATE_a735_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l844_l838_l835_l829_l858_l854_DUPLICATE_02a1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l844_l838_l835_l863_l829_l854_l848_DUPLICATE_a9e7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l829_l844_l835_l848_DUPLICATE_0546_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l844_l838_l835_l863_l858_l854_l848_DUPLICATE_c205_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l835_l838_DUPLICATE_711c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l844_l838_l854_DUPLICATE_9ba8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_355a_uxn_opcodes_h_l869_l825_DUPLICATE_e85c_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l855_c3_ab4a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l855_c3_ab4a;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l846_c3_cc2e := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l846_c3_cc2e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l842_c32_b562_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l842_c32_ae08_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l842_c32_ae08_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l851_c3_425a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l851_c3_425a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l836_c3_c0ad := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l836_c3_c0ad;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_bbe2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_bbe2;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l842_c32_4202_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_right := to_unsigned(5, 3);

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

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l842_c32_b562_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l861_c15_7e93_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_CONST_SR_8_uxn_opcodes_h_l856_c34_97f7_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l835_c7_5309_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l829_c6_4e4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l835_l838_DUPLICATE_711c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l835_l838_DUPLICATE_711c_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l858_c11_3962] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_left;
     BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_return_output := BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l844_l838_l835_l863_l829_l854_l848_DUPLICATE_a9e7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l844_l838_l835_l863_l829_l854_l848_DUPLICATE_a9e7_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l844_l838_l835_l829_l854_DUPLICATE_5a9f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l844_l838_l835_l829_l854_DUPLICATE_5a9f_return_output := result.stack_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l844_l838_l835_l829_l858_l854_l848_DUPLICATE_dda3 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l844_l838_l835_l829_l858_l854_l848_DUPLICATE_dda3_return_output := result.pc;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l852_c24_4e14] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l852_c24_4e14_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l838_l835_l863_l829_l858_l854_l848_DUPLICATE_bd95 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l838_l835_l863_l829_l858_l854_l848_DUPLICATE_bd95_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l844_l838_l835_l829_l858_l854_DUPLICATE_02a1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l844_l838_l835_l829_l858_l854_DUPLICATE_02a1_return_output := result.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l829_l844_l835_DUPLICATE_a735 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l829_l844_l835_DUPLICATE_a735_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l838_c11_1f60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_left;
     BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_return_output := BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l844_l838_l854_DUPLICATE_9ba8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l844_l838_l854_DUPLICATE_9ba8_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l835_c11_9f6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l861_c20_4ca0] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l861_c20_4ca0_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l848_c11_b85e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_left;
     BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_return_output := BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l863_c11_d5c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l856_c34_97f7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l856_c34_97f7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l856_c34_97f7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l856_c34_97f7_return_output := CONST_SR_8_uxn_opcodes_h_l856_c34_97f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l854_c11_051f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_left;
     BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_return_output := BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l842_c32_b562] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l842_c32_b562_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l842_c32_b562_left;
     BIN_OP_AND_uxn_opcodes_h_l842_c32_b562_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l842_c32_b562_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l842_c32_b562_return_output := BIN_OP_AND_uxn_opcodes_h_l842_c32_b562_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l844_l838_l835_l863_l858_l854_l848_DUPLICATE_c205 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l844_l838_l835_l863_l858_l854_l848_DUPLICATE_c205_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l829_l844_l835_l848_DUPLICATE_0546 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l829_l844_l835_l848_DUPLICATE_0546_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l844_c11_747b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_left;
     BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_return_output := BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l842_c32_4202_left := VAR_BIN_OP_AND_uxn_opcodes_h_l842_c32_b562_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l829_c2_9fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4e4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_5309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l835_c7_5309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9f6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l838_c7_9e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_1f60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_747b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l848_c7_096b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_b85e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_051f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_3962_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_d5c7_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l861_c15_7e93_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l861_c20_4ca0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l852_c24_4e14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l829_l844_l835_DUPLICATE_a735_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l829_l844_l835_DUPLICATE_a735_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l829_l844_l835_DUPLICATE_a735_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l844_l838_l835_l829_l858_l854_l848_DUPLICATE_dda3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_5309_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l844_l838_l835_l829_l858_l854_l848_DUPLICATE_dda3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l844_l838_l835_l829_l858_l854_l848_DUPLICATE_dda3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l844_l838_l835_l829_l858_l854_l848_DUPLICATE_dda3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l848_c7_096b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l844_l838_l835_l829_l858_l854_l848_DUPLICATE_dda3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l844_l838_l835_l829_l858_l854_l848_DUPLICATE_dda3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l844_l838_l835_l829_l858_l854_l848_DUPLICATE_dda3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l844_l838_l835_l863_l858_l854_l848_DUPLICATE_c205_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l844_l838_l835_l863_l858_l854_l848_DUPLICATE_c205_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l844_l838_l835_l863_l858_l854_l848_DUPLICATE_c205_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l844_l838_l835_l863_l858_l854_l848_DUPLICATE_c205_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l844_l838_l835_l863_l858_l854_l848_DUPLICATE_c205_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l844_l838_l835_l863_l858_l854_l848_DUPLICATE_c205_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l844_l838_l835_l863_l858_l854_l848_DUPLICATE_c205_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l844_l838_l835_l863_l829_l854_l848_DUPLICATE_a9e7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l844_l838_l835_l863_l829_l854_l848_DUPLICATE_a9e7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l844_l838_l835_l863_l829_l854_l848_DUPLICATE_a9e7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l844_l838_l835_l863_l829_l854_l848_DUPLICATE_a9e7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l844_l838_l835_l863_l829_l854_l848_DUPLICATE_a9e7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l844_l838_l835_l863_l829_l854_l848_DUPLICATE_a9e7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l844_l838_l835_l863_l829_l854_l848_DUPLICATE_a9e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l829_l844_l835_l848_DUPLICATE_0546_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l829_l844_l835_l848_DUPLICATE_0546_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l829_l844_l835_l848_DUPLICATE_0546_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l829_l844_l835_l848_DUPLICATE_0546_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l838_l835_l863_l829_l858_l854_l848_DUPLICATE_bd95_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l838_l835_l863_l829_l858_l854_l848_DUPLICATE_bd95_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l838_l835_l863_l829_l858_l854_l848_DUPLICATE_bd95_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l838_l835_l863_l829_l858_l854_l848_DUPLICATE_bd95_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l838_l835_l863_l829_l858_l854_l848_DUPLICATE_bd95_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l838_l835_l863_l829_l858_l854_l848_DUPLICATE_bd95_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l838_l835_l863_l829_l858_l854_l848_DUPLICATE_bd95_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l835_l838_DUPLICATE_711c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l835_l838_DUPLICATE_711c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l844_l838_l835_l829_l858_l854_DUPLICATE_02a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l844_l838_l835_l829_l858_l854_DUPLICATE_02a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l844_l838_l835_l829_l858_l854_DUPLICATE_02a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l844_l838_l835_l829_l858_l854_DUPLICATE_02a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l844_l838_l835_l829_l858_l854_DUPLICATE_02a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l844_l838_l835_l829_l858_l854_DUPLICATE_02a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l844_l838_l854_DUPLICATE_9ba8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l844_l838_l854_DUPLICATE_9ba8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l844_l838_l854_DUPLICATE_9ba8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l844_l838_l835_l829_l854_DUPLICATE_5a9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l844_l838_l835_l829_l854_DUPLICATE_5a9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l844_l838_l835_l829_l854_DUPLICATE_5a9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l844_l838_l835_l829_l854_DUPLICATE_5a9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l844_l838_l835_l829_l854_DUPLICATE_5a9f_return_output;
     -- t8_MUX[uxn_opcodes_h_l838_c7_9e9c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l838_c7_9e9c_cond <= VAR_t8_MUX_uxn_opcodes_h_l838_c7_9e9c_cond;
     t8_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue;
     t8_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output := t8_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l844_c7_01c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l856_c24_78ad] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l856_c24_78ad_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l856_c34_97f7_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l854_c7_37c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l861_c15_7e93] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l861_c15_7e93_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l861_c15_7e93_left;
     BIN_OP_PLUS_uxn_opcodes_h_l861_c15_7e93_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l861_c15_7e93_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l861_c15_7e93_return_output := BIN_OP_PLUS_uxn_opcodes_h_l861_c15_7e93_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l838_c7_9e9c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l858_c7_51d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l863_c7_21d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l863_c7_21d1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l842_c32_4202] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l842_c32_4202_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l842_c32_4202_left;
     BIN_OP_GT_uxn_opcodes_h_l842_c32_4202_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l842_c32_4202_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l842_c32_4202_return_output := BIN_OP_GT_uxn_opcodes_h_l842_c32_4202_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l863_c7_21d1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l848_c7_096b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l829_c1_491e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l842_c32_ae08_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l842_c32_4202_return_output;
     VAR_result_pc_uxn_opcodes_h_l861_c3_8afd := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l861_c15_7e93_return_output)),16);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l856_c24_78ad_return_output;
     VAR_printf_uxn_opcodes_h_l830_c3_8fee_uxn_opcodes_h_l830_c3_8fee_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_491e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_21d1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_21d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l848_c7_096b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_21d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_51d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_01c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_37c1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l835_c7_5309_iffalse := VAR_t8_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue := VAR_result_pc_uxn_opcodes_h_l861_c3_8afd;
     -- printf_uxn_opcodes_h_l830_c3_8fee[uxn_opcodes_h_l830_c3_8fee] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l830_c3_8fee_uxn_opcodes_h_l830_c3_8fee_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l830_c3_8fee_uxn_opcodes_h_l830_c3_8fee_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l854_c7_37c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l858_c7_51d1] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_cond;
     result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue;
     result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_return_output := result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l835_c7_5309] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l858_c7_51d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_return_output;

     -- t8_MUX[uxn_opcodes_h_l835_c7_5309] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l835_c7_5309_cond <= VAR_t8_MUX_uxn_opcodes_h_l835_c7_5309_cond;
     t8_MUX_uxn_opcodes_h_l835_c7_5309_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l835_c7_5309_iftrue;
     t8_MUX_uxn_opcodes_h_l835_c7_5309_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l835_c7_5309_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l835_c7_5309_return_output := t8_MUX_uxn_opcodes_h_l835_c7_5309_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l844_c7_01c6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_return_output;

     -- MUX[uxn_opcodes_h_l842_c32_ae08] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l842_c32_ae08_cond <= VAR_MUX_uxn_opcodes_h_l842_c32_ae08_cond;
     MUX_uxn_opcodes_h_l842_c32_ae08_iftrue <= VAR_MUX_uxn_opcodes_h_l842_c32_ae08_iftrue;
     MUX_uxn_opcodes_h_l842_c32_ae08_iffalse <= VAR_MUX_uxn_opcodes_h_l842_c32_ae08_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l842_c32_ae08_return_output := MUX_uxn_opcodes_h_l842_c32_ae08_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l858_c7_51d1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l854_c7_37c1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_return_output := result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l858_c7_51d1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l848_c7_096b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue := VAR_MUX_uxn_opcodes_h_l842_c32_ae08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_51d1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_51d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_01c6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_51d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_5309_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_37c1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_51d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_096b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_37c1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse := VAR_t8_MUX_uxn_opcodes_h_l835_c7_5309_return_output;
     -- t8_MUX[uxn_opcodes_h_l829_c2_9fed] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l829_c2_9fed_cond <= VAR_t8_MUX_uxn_opcodes_h_l829_c2_9fed_cond;
     t8_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue;
     t8_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l829_c2_9fed_return_output := t8_MUX_uxn_opcodes_h_l829_c2_9fed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l844_c7_01c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l848_c7_096b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l838_c7_9e9c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l829_c2_9fed] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l854_c7_37c1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l854_c7_37c1] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_cond;
     result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue;
     result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_return_output := result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l838_c7_9e9c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l848_c7_096b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_return_output := result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l854_c7_37c1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l854_c7_37c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_37c1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_37c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_37c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_096b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l848_c7_096b_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_37c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_01c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l848_c7_096b_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l829_c2_9fed_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l835_c7_5309] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_5309] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l848_c7_096b] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l848_c7_096b_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l848_c7_096b_cond;
     result_pc_MUX_uxn_opcodes_h_l848_c7_096b_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l848_c7_096b_iftrue;
     result_pc_MUX_uxn_opcodes_h_l848_c7_096b_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l848_c7_096b_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l848_c7_096b_return_output := result_pc_MUX_uxn_opcodes_h_l848_c7_096b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l848_c7_096b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l848_c7_096b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l838_c7_9e9c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l844_c7_01c6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_return_output := result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l848_c7_096b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l844_c7_01c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_096b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l848_c7_096b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_5309_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l848_c7_096b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_01c6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l848_c7_096b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_5309_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_01c6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l838_c7_9e9c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l838_c7_9e9c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output := result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l844_c7_01c6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l829_c2_9fed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_5309] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l844_c7_01c6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l844_c7_01c6] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_cond;
     result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue;
     result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_return_output := result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l829_c2_9fed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l844_c7_01c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_01c6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l844_c7_01c6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l844_c7_01c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l844_c7_01c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_5309_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l835_c7_5309] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_cond;
     result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_return_output := result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l838_c7_9e9c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l838_c7_9e9c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_cond;
     result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output := result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l829_c2_9fed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l838_c7_9e9c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l838_c7_9e9c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_5309] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_5309_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_5309_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l838_c7_9e9c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_5309_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l835_c7_5309] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l835_c7_5309] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l829_c2_9fed] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_cond;
     result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_return_output := result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l829_c2_9fed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l835_c7_5309] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l835_c7_5309_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_5309_cond;
     result_pc_MUX_uxn_opcodes_h_l835_c7_5309_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_5309_iftrue;
     result_pc_MUX_uxn_opcodes_h_l835_c7_5309_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_5309_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_5309_return_output := result_pc_MUX_uxn_opcodes_h_l835_c7_5309_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_5309] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_5309_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_5309_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_5309_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_5309_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l829_c2_9fed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l829_c2_9fed] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l829_c2_9fed] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l829_c2_9fed] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_cond;
     result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_iftrue;
     result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_return_output := result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_355a_uxn_opcodes_h_l869_l825_DUPLICATE_e85c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_355a_uxn_opcodes_h_l869_l825_DUPLICATE_e85c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_355a(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_9fed_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c2_9fed_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l829_c2_9fed_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_9fed_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_9fed_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_9fed_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c2_9fed_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_9fed_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_9fed_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_9fed_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_355a_uxn_opcodes_h_l869_l825_DUPLICATE_e85c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_355a_uxn_opcodes_h_l869_l825_DUPLICATE_e85c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
