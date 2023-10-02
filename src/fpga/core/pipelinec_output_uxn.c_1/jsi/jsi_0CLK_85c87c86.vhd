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
-- Submodules: 93
entity jsi_0CLK_85c87c86 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsi_0CLK_85c87c86;
architecture arch of jsi_0CLK_85c87c86 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l173_c6_8d20]
signal BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l173_c1_695e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l173_c2_cb59]
signal result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l173_c2_cb59]
signal result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l173_c2_cb59]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l173_c2_cb59]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l173_c2_cb59]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l173_c2_cb59]
signal result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l173_c2_cb59]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l173_c2_cb59]
signal result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l173_c2_cb59]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l173_c2_cb59]
signal result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l173_c2_cb59]
signal result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l173_c2_cb59]
signal result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l173_c2_cb59]
signal result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l173_c2_cb59]
signal tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l174_c3_81a5[uxn_opcodes_h_l174_c3_81a5]
signal printf_uxn_opcodes_h_l174_c3_81a5_uxn_opcodes_h_l174_c3_81a5_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l177_c11_ec6b]
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c11_ec6b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c11_ec6b_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c11_ec6b_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l181_c11_3357]
signal BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l181_c7_f4df]
signal result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l181_c7_f4df]
signal result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l181_c7_f4df]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l181_c7_f4df]
signal result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l181_c7_f4df]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l181_c7_f4df]
signal result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l181_c7_f4df]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l181_c7_f4df]
signal result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l181_c7_f4df]
signal result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l181_c7_f4df]
signal result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l181_c7_f4df]
signal result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l181_c7_f4df]
signal tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l188_c11_b36c]
signal BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l188_c7_83d4]
signal result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l188_c7_83d4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l188_c7_83d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l188_c7_83d4]
signal result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l188_c7_83d4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l188_c7_83d4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l188_c7_83d4]
signal result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l188_c7_83d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l188_c7_83d4]
signal result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l188_c7_83d4]
signal tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l191_c34_4c26]
signal CONST_SR_8_uxn_opcodes_h_l191_c34_4c26_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l191_c34_4c26_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l193_c11_0887]
signal BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l193_c7_b4d7]
signal result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l193_c7_b4d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l193_c7_b4d7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l193_c7_b4d7]
signal result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l193_c7_b4d7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l193_c7_b4d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l193_c7_b4d7]
signal result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l193_c7_b4d7]
signal tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l199_c11_77ab]
signal BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l199_c7_d643]
signal result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l199_c7_d643]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l199_c7_d643]
signal result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l199_c7_d643]
signal result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l199_c7_d643]
signal result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l199_c7_d643]
signal result_pc_MUX_uxn_opcodes_h_l199_c7_d643_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l199_c7_d643_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l199_c7_d643_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l199_c7_d643_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l199_c7_d643]
signal tmp16_MUX_uxn_opcodes_h_l199_c7_d643_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l199_c7_d643_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l199_c7_d643_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l199_c7_d643_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l204_c11_54ef]
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l204_c7_8248]
signal result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l204_c7_8248]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l204_c7_8248]
signal result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l204_c7_8248]
signal result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l204_c7_8248]
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l204_c7_8248]
signal result_pc_MUX_uxn_opcodes_h_l204_c7_8248_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l204_c7_8248_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l204_c7_8248_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l204_c7_8248_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l204_c7_8248]
signal tmp16_MUX_uxn_opcodes_h_l204_c7_8248_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l204_c7_8248_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l204_c7_8248_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l204_c7_8248_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l206_c3_dd5d]
signal CONST_SL_8_uxn_opcodes_h_l206_c3_dd5d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l206_c3_dd5d_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l209_c21_2c44]
signal BIN_OP_PLUS_uxn_opcodes_h_l209_c21_2c44_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l209_c21_2c44_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l209_c21_2c44_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l211_c11_692c]
signal BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l211_c7_11d6]
signal result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l211_c7_11d6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l211_c7_11d6]
signal result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l211_c7_11d6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l211_c7_11d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l211_c7_11d6]
signal result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l211_c7_11d6]
signal tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l214_c21_feb0]
signal BIN_OP_PLUS_uxn_opcodes_h_l214_c21_feb0_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l214_c21_feb0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l214_c21_feb0_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l216_c11_a405]
signal BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l216_c7_4981]
signal result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l216_c7_4981]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l216_c7_4981]
signal result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l216_c7_4981]
signal result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l216_c7_4981]
signal result_pc_MUX_uxn_opcodes_h_l216_c7_4981_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l216_c7_4981_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l216_c7_4981_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l216_c7_4981_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l216_c7_4981]
signal tmp16_MUX_uxn_opcodes_h_l216_c7_4981_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l216_c7_4981_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l216_c7_4981_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l216_c7_4981_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l217_c3_b415]
signal BIN_OP_OR_uxn_opcodes_h_l217_c3_b415_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l217_c3_b415_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l217_c3_b415_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l221_c15_be90]
signal BIN_OP_PLUS_uxn_opcodes_h_l221_c15_be90_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l221_c15_be90_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l221_c15_be90_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l221_c15_86b8]
signal BIN_OP_PLUS_uxn_opcodes_h_l221_c15_86b8_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l221_c15_86b8_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l221_c15_86b8_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_3ddb( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned;
 ref_toks_13 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_addr := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.pc := ref_toks_6;
      base.is_sp_shift := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_ram_read := ref_toks_10;
      base.is_opc_done := ref_toks_11;
      base.is_stack_read := ref_toks_12;
      base.stack_value := ref_toks_13;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20
BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_left,
BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_right,
BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59
result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_cond,
result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59
result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59
result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_return_output);

-- result_pc_MUX_uxn_opcodes_h_l173_c2_cb59
result_pc_MUX_uxn_opcodes_h_l173_c2_cb59 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_cond,
result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue,
result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse,
result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59
result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59
result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59
result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59
result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59
result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59
result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59
result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_cond,
result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_return_output);

-- tmp16_MUX_uxn_opcodes_h_l173_c2_cb59
tmp16_MUX_uxn_opcodes_h_l173_c2_cb59 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_cond,
tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue,
tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse,
tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_return_output);

-- printf_uxn_opcodes_h_l174_c3_81a5_uxn_opcodes_h_l174_c3_81a5
printf_uxn_opcodes_h_l174_c3_81a5_uxn_opcodes_h_l174_c3_81a5 : entity work.printf_uxn_opcodes_h_l174_c3_81a5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l174_c3_81a5_uxn_opcodes_h_l174_c3_81a5_CLOCK_ENABLE);

-- BIN_OP_PLUS_uxn_opcodes_h_l177_c11_ec6b
BIN_OP_PLUS_uxn_opcodes_h_l177_c11_ec6b : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l177_c11_ec6b_left,
BIN_OP_PLUS_uxn_opcodes_h_l177_c11_ec6b_right,
BIN_OP_PLUS_uxn_opcodes_h_l177_c11_ec6b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357
BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_left,
BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_right,
BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df
result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_cond,
result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df
result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_return_output);

-- result_pc_MUX_uxn_opcodes_h_l181_c7_f4df
result_pc_MUX_uxn_opcodes_h_l181_c7_f4df : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_cond,
result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue,
result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse,
result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df
result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df
result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df
result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df
result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df
result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df
result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df
result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_cond,
result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_return_output);

-- tmp16_MUX_uxn_opcodes_h_l181_c7_f4df
tmp16_MUX_uxn_opcodes_h_l181_c7_f4df : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_cond,
tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue,
tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse,
tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c
BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_left,
BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_right,
BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4
result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4
result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_return_output);

-- result_pc_MUX_uxn_opcodes_h_l188_c7_83d4
result_pc_MUX_uxn_opcodes_h_l188_c7_83d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_cond,
result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue,
result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse,
result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4
result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4
result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4
result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4
result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4
result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_cond,
result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l188_c7_83d4
tmp16_MUX_uxn_opcodes_h_l188_c7_83d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_cond,
tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue,
tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse,
tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_return_output);

-- CONST_SR_8_uxn_opcodes_h_l191_c34_4c26
CONST_SR_8_uxn_opcodes_h_l191_c34_4c26 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l191_c34_4c26_x,
CONST_SR_8_uxn_opcodes_h_l191_c34_4c26_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887
BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_left,
BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_right,
BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7
result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7
result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7
result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output);

-- result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7
result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_cond,
result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue,
result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse,
result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7
tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_cond,
tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue,
tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse,
tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab
BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_left,
BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_right,
BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643
result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_cond,
result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643
result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643
result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643
result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643
result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_return_output);

-- result_pc_MUX_uxn_opcodes_h_l199_c7_d643
result_pc_MUX_uxn_opcodes_h_l199_c7_d643 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l199_c7_d643_cond,
result_pc_MUX_uxn_opcodes_h_l199_c7_d643_iftrue,
result_pc_MUX_uxn_opcodes_h_l199_c7_d643_iffalse,
result_pc_MUX_uxn_opcodes_h_l199_c7_d643_return_output);

-- tmp16_MUX_uxn_opcodes_h_l199_c7_d643
tmp16_MUX_uxn_opcodes_h_l199_c7_d643 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l199_c7_d643_cond,
tmp16_MUX_uxn_opcodes_h_l199_c7_d643_iftrue,
tmp16_MUX_uxn_opcodes_h_l199_c7_d643_iffalse,
tmp16_MUX_uxn_opcodes_h_l199_c7_d643_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef
BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_left,
BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_right,
BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248
result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_cond,
result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248
result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248
result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_return_output);

-- result_pc_MUX_uxn_opcodes_h_l204_c7_8248
result_pc_MUX_uxn_opcodes_h_l204_c7_8248 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l204_c7_8248_cond,
result_pc_MUX_uxn_opcodes_h_l204_c7_8248_iftrue,
result_pc_MUX_uxn_opcodes_h_l204_c7_8248_iffalse,
result_pc_MUX_uxn_opcodes_h_l204_c7_8248_return_output);

-- tmp16_MUX_uxn_opcodes_h_l204_c7_8248
tmp16_MUX_uxn_opcodes_h_l204_c7_8248 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l204_c7_8248_cond,
tmp16_MUX_uxn_opcodes_h_l204_c7_8248_iftrue,
tmp16_MUX_uxn_opcodes_h_l204_c7_8248_iffalse,
tmp16_MUX_uxn_opcodes_h_l204_c7_8248_return_output);

-- CONST_SL_8_uxn_opcodes_h_l206_c3_dd5d
CONST_SL_8_uxn_opcodes_h_l206_c3_dd5d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l206_c3_dd5d_x,
CONST_SL_8_uxn_opcodes_h_l206_c3_dd5d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l209_c21_2c44
BIN_OP_PLUS_uxn_opcodes_h_l209_c21_2c44 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l209_c21_2c44_left,
BIN_OP_PLUS_uxn_opcodes_h_l209_c21_2c44_right,
BIN_OP_PLUS_uxn_opcodes_h_l209_c21_2c44_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c
BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_left,
BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_right,
BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6
result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6
result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6
result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6
result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6
result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_return_output);

-- result_pc_MUX_uxn_opcodes_h_l211_c7_11d6
result_pc_MUX_uxn_opcodes_h_l211_c7_11d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_cond,
result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue,
result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse,
result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l211_c7_11d6
tmp16_MUX_uxn_opcodes_h_l211_c7_11d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_cond,
tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue,
tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse,
tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l214_c21_feb0
BIN_OP_PLUS_uxn_opcodes_h_l214_c21_feb0 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l214_c21_feb0_left,
BIN_OP_PLUS_uxn_opcodes_h_l214_c21_feb0_right,
BIN_OP_PLUS_uxn_opcodes_h_l214_c21_feb0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405
BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_left,
BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_right,
BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981
result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_cond,
result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981
result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981
result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981
result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_return_output);

-- result_pc_MUX_uxn_opcodes_h_l216_c7_4981
result_pc_MUX_uxn_opcodes_h_l216_c7_4981 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l216_c7_4981_cond,
result_pc_MUX_uxn_opcodes_h_l216_c7_4981_iftrue,
result_pc_MUX_uxn_opcodes_h_l216_c7_4981_iffalse,
result_pc_MUX_uxn_opcodes_h_l216_c7_4981_return_output);

-- tmp16_MUX_uxn_opcodes_h_l216_c7_4981
tmp16_MUX_uxn_opcodes_h_l216_c7_4981 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l216_c7_4981_cond,
tmp16_MUX_uxn_opcodes_h_l216_c7_4981_iftrue,
tmp16_MUX_uxn_opcodes_h_l216_c7_4981_iffalse,
tmp16_MUX_uxn_opcodes_h_l216_c7_4981_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l217_c3_b415
BIN_OP_OR_uxn_opcodes_h_l217_c3_b415 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l217_c3_b415_left,
BIN_OP_OR_uxn_opcodes_h_l217_c3_b415_right,
BIN_OP_OR_uxn_opcodes_h_l217_c3_b415_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l221_c15_be90
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_be90 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_be90_left,
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_be90_right,
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_be90_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l221_c15_86b8
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_86b8 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_86b8_left,
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_86b8_right,
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_86b8_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
 result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
 tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l177_c11_ec6b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_return_output,
 result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_return_output,
 tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_return_output,
 result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_return_output,
 tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_return_output,
 CONST_SR_8_uxn_opcodes_h_l191_c34_4c26_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output,
 result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output,
 tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_return_output,
 result_pc_MUX_uxn_opcodes_h_l199_c7_d643_return_output,
 tmp16_MUX_uxn_opcodes_h_l199_c7_d643_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_return_output,
 result_pc_MUX_uxn_opcodes_h_l204_c7_8248_return_output,
 tmp16_MUX_uxn_opcodes_h_l204_c7_8248_return_output,
 CONST_SL_8_uxn_opcodes_h_l206_c3_dd5d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l209_c21_2c44_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_return_output,
 result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_return_output,
 tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l214_c21_feb0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_return_output,
 result_pc_MUX_uxn_opcodes_h_l216_c7_4981_return_output,
 tmp16_MUX_uxn_opcodes_h_l216_c7_4981_return_output,
 BIN_OP_OR_uxn_opcodes_h_l217_c3_b415_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l221_c15_be90_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l221_c15_86b8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_iffalse : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l176_c3_1a12 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l173_c2_cb59_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l177_c3_5ed1 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l174_c3_81a5_uxn_opcodes_h_l174_c3_81a5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_ec6b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_ec6b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_ec6b_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l185_c3_b6fa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l181_c7_f4df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l186_c24_a8e7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l190_c3_47d6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l191_c34_4c26_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l191_c34_4c26_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l191_c24_b511_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_d643_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_d643_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_d643_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_d643_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_8248_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_d643_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_d643_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l202_c3_74bc : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_d643_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_8248_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_d643_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l209_c3_496e : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_8248_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_8248_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_8248_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_8248_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_8248_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_8248_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l206_c3_dd5d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l206_c3_dd5d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_2c44_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_2c44_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_2c44_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l214_c3_a50a : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_4981_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_4981_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_feb0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_feb0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_feb0_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l219_c3_86a2 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_4981_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l221_c3_0ceb : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_4981_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_4981_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_4981_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_4981_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_4981_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_b415_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_b415_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_b415_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_be90_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_be90_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_be90_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_86b8_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_86b8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_86b8_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_49d4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l199_l188_l181_l173_l211_DUPLICATE_c99e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l173_l188_DUPLICATE_5a74_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l173_l211_l204_DUPLICATE_52c9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l173_l193_DUPLICATE_2b93_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l199_l193_l188_l181_l173_l211_l204_DUPLICATE_a7f9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_af36_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l173_l181_DUPLICATE_f9cd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l173_l188_DUPLICATE_2030_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l211_l204_DUPLICATE_3644_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l217_l205_DUPLICATE_4f8a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3ddb_uxn_opcodes_h_l228_l169_DUPLICATE_e2fe_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_right := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_86b8_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_iftrue := to_unsigned(1, 1);
     VAR_result_ram_addr_uxn_opcodes_h_l219_c3_86a2 := resize(to_unsigned(0, 1), 16);
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l219_c3_86a2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l190_c3_47d6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l190_c3_47d6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_iffalse := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l185_c3_b6fa := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l185_c3_b6fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_right := to_unsigned(6, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_feb0_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_iftrue := to_unsigned(0, 1);
     VAR_tmp16_uxn_opcodes_h_l202_c3_74bc := resize(to_unsigned(0, 1), 16);
     VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_d643_iftrue := VAR_tmp16_uxn_opcodes_h_l202_c3_74bc;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l176_c3_1a12 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l176_c3_1a12;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_2c44_right := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_ec6b_right := to_unsigned(2, 2);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_ec6b_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_2c44_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_feb0_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_be90_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_b415_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l191_c34_4c26_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_4981_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l211_c11_692c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_left;
     BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_return_output := BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l173_l188_DUPLICATE_5a74 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l173_l188_DUPLICATE_5a74_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l173_c2_cb59] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l173_c2_cb59_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l173_l211_l204_DUPLICATE_52c9 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l173_l211_l204_DUPLICATE_52c9_return_output := result.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l173_l181_DUPLICATE_f9cd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l173_l181_DUPLICATE_f9cd_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l199_l188_l181_l173_l211_DUPLICATE_c99e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l199_l188_l181_l173_l211_DUPLICATE_c99e_return_output := result.is_ram_write;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l173_c2_cb59] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l173_c2_cb59_return_output := result.sp_relative_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l186_c24_a8e7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l186_c24_a8e7_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l193_c11_0887] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_left;
     BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_return_output := BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l173_l188_DUPLICATE_2030 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l173_l188_DUPLICATE_2030_return_output := result.stack_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_49d4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_49d4_return_output := result.ram_addr;

     -- CONST_SR_8[uxn_opcodes_h_l191_c34_4c26] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l191_c34_4c26_x <= VAR_CONST_SR_8_uxn_opcodes_h_l191_c34_4c26_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l191_c34_4c26_return_output := CONST_SR_8_uxn_opcodes_h_l191_c34_4c26_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l181_c7_f4df] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l181_c7_f4df_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l173_l193_DUPLICATE_2b93 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l173_l193_DUPLICATE_2b93_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l204_c11_54ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l214_c21_feb0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l214_c21_feb0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_feb0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l214_c21_feb0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_feb0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_feb0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l214_c21_feb0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l216_c11_a405] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_left;
     BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_return_output := BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l209_c21_2c44] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l209_c21_2c44_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_2c44_left;
     BIN_OP_PLUS_uxn_opcodes_h_l209_c21_2c44_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_2c44_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_2c44_return_output := BIN_OP_PLUS_uxn_opcodes_h_l209_c21_2c44_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l211_l204_DUPLICATE_3644 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l211_l204_DUPLICATE_3644_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l181_c11_3357] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_left;
     BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_return_output := BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l173_c6_8d20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_left;
     BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_return_output := BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_af36 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_af36_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l188_c11_b36c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_left;
     BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_return_output := BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l217_l205_DUPLICATE_4f8a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l217_l205_DUPLICATE_4f8a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l199_l193_l188_l181_l173_l211_l204_DUPLICATE_a7f9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l199_l193_l188_l181_l173_l211_l204_DUPLICATE_a7f9_return_output := result.is_pc_updated;

     -- BIN_OP_PLUS[uxn_opcodes_h_l177_c11_ec6b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l177_c11_ec6b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_ec6b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l177_c11_ec6b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_ec6b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_ec6b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l177_c11_ec6b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l199_c11_77ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_8d20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_3357_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_b36c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_0887_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_d643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_d643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_77ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_8248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_8248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_54ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_692c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_4981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_4981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_a405_return_output;
     VAR_tmp16_uxn_opcodes_h_l177_c3_5ed1 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_ec6b_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l209_c3_496e := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_2c44_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l214_c3_a50a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_feb0_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_b415_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l217_l205_DUPLICATE_4f8a_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l206_c3_dd5d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l217_l205_DUPLICATE_4f8a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l186_c24_a8e7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l173_l211_l204_DUPLICATE_52c9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l173_l211_l204_DUPLICATE_52c9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l173_l211_l204_DUPLICATE_52c9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l173_l211_l204_DUPLICATE_52c9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_d643_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l173_l211_l204_DUPLICATE_52c9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_8248_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l173_l211_l204_DUPLICATE_52c9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l173_l211_l204_DUPLICATE_52c9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_4981_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l173_l211_l204_DUPLICATE_52c9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_49d4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_49d4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_49d4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_49d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l211_l204_DUPLICATE_3644_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l211_l204_DUPLICATE_3644_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l211_l204_DUPLICATE_3644_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l211_l204_DUPLICATE_3644_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l211_l204_DUPLICATE_3644_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l211_l204_DUPLICATE_3644_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l211_l204_DUPLICATE_3644_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l199_l193_l188_l181_l173_l211_l204_DUPLICATE_a7f9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l199_l193_l188_l181_l173_l211_l204_DUPLICATE_a7f9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l199_l193_l188_l181_l173_l211_l204_DUPLICATE_a7f9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l199_l193_l188_l181_l173_l211_l204_DUPLICATE_a7f9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l199_l193_l188_l181_l173_l211_l204_DUPLICATE_a7f9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l199_l193_l188_l181_l173_l211_l204_DUPLICATE_a7f9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l199_l193_l188_l181_l173_l211_l204_DUPLICATE_a7f9_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_af36_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_af36_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_af36_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_af36_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l199_l188_l181_l173_l211_DUPLICATE_c99e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l199_l188_l181_l173_l211_DUPLICATE_c99e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l199_l188_l181_l173_l211_DUPLICATE_c99e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l199_l188_l181_l173_l211_DUPLICATE_c99e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l199_l188_l181_l173_l211_DUPLICATE_c99e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l173_l181_DUPLICATE_f9cd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l173_l181_DUPLICATE_f9cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l173_l193_DUPLICATE_2b93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l173_l193_DUPLICATE_2b93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l173_l188_DUPLICATE_5a74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l173_l188_DUPLICATE_5a74_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l173_l188_DUPLICATE_2030_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l173_l188_DUPLICATE_2030_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l181_c7_f4df_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l173_c2_cb59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l173_c2_cb59_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l209_c3_496e;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l214_c3_a50a;
     VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue := VAR_tmp16_uxn_opcodes_h_l177_c3_5ed1;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l193_c7_b4d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l217_c3_b415] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l217_c3_b415_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_b415_left;
     BIN_OP_OR_uxn_opcodes_h_l217_c3_b415_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_b415_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_b415_return_output := BIN_OP_OR_uxn_opcodes_h_l217_c3_b415_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l188_c7_83d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l216_c7_4981] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l173_c1_695e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l191_c24_b511] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l191_c24_b511_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l191_c34_4c26_return_output);

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l216_c7_4981] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l211_c7_11d6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l173_c2_cb59] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l173_c2_cb59] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l181_c7_f4df] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l181_c7_f4df] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l216_c7_4981] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_return_output := result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l206_c3_dd5d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l206_c3_dd5d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l206_c3_dd5d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l206_c3_dd5d_return_output := CONST_SL_8_uxn_opcodes_h_l206_c3_dd5d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l216_c7_4981] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_be90_right := VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_b415_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_4981_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_b415_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l191_c24_b511_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_8248_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l206_c3_dd5d_return_output;
     VAR_printf_uxn_opcodes_h_l174_c3_81a5_uxn_opcodes_h_l174_c3_81a5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_695e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_4981_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_4981_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_4981_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_11d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_4981_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_83d4_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l204_c7_8248] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l188_c7_83d4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_return_output := result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l173_c2_cb59] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l211_c7_11d6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l211_c7_11d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l173_c2_cb59] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l188_c7_83d4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l211_c7_11d6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l181_c7_f4df] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l221_c15_be90] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l221_c15_be90_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_be90_left;
     BIN_OP_PLUS_uxn_opcodes_h_l221_c15_be90_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_be90_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_be90_return_output := BIN_OP_PLUS_uxn_opcodes_h_l221_c15_be90_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l211_c7_11d6] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_return_output;

     -- printf_uxn_opcodes_h_l174_c3_81a5[uxn_opcodes_h_l174_c3_81a5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l174_c3_81a5_uxn_opcodes_h_l174_c3_81a5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l174_c3_81a5_uxn_opcodes_h_l174_c3_81a5_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- tmp16_MUX[uxn_opcodes_h_l216_c7_4981] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l216_c7_4981_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_4981_cond;
     tmp16_MUX_uxn_opcodes_h_l216_c7_4981_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_4981_iftrue;
     tmp16_MUX_uxn_opcodes_h_l216_c7_4981_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_4981_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_4981_return_output := tmp16_MUX_uxn_opcodes_h_l216_c7_4981_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_86b8_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_be90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_11d6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_11d6_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_11d6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_8248_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_83d4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_11d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_83d4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_4981_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l211_c7_11d6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_cond;
     tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_return_output := tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l181_c7_f4df] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l204_c7_8248] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l204_c7_8248] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_return_output := result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l181_c7_f4df] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_cond;
     result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_return_output := result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l204_c7_8248] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l221_c15_86b8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l221_c15_86b8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_86b8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l221_c15_86b8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_86b8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_86b8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l221_c15_86b8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l173_c2_cb59] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l199_c7_d643] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l204_c7_8248] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l221_c3_0ceb := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_86b8_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_8248_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_8248_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_8248_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_d643_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_8248_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_8248_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_11d6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_4981_iftrue := VAR_result_pc_uxn_opcodes_h_l221_c3_0ceb;
     -- result_ram_addr_MUX[uxn_opcodes_h_l199_c7_d643] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_return_output := result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l193_c7_b4d7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l173_c2_cb59] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l199_c7_d643] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l199_c7_d643] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l216_c7_4981] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l216_c7_4981_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_4981_cond;
     result_pc_MUX_uxn_opcodes_h_l216_c7_4981_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_4981_iftrue;
     result_pc_MUX_uxn_opcodes_h_l216_c7_4981_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_4981_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_4981_return_output := result_pc_MUX_uxn_opcodes_h_l216_c7_4981_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l199_c7_d643] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l173_c2_cb59] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_cond;
     result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_return_output := result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l204_c7_8248] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l204_c7_8248_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_8248_cond;
     tmp16_MUX_uxn_opcodes_h_l204_c7_8248_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_8248_iftrue;
     tmp16_MUX_uxn_opcodes_h_l204_c7_8248_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_8248_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_8248_return_output := tmp16_MUX_uxn_opcodes_h_l204_c7_8248_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_d643_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_d643_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_d643_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_4981_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_d643_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_d643_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_8248_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l211_c7_11d6] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_cond;
     result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_iftrue;
     result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_return_output := result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l193_c7_b4d7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l193_c7_b4d7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l193_c7_b4d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l188_c7_83d4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l193_c7_b4d7] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l199_c7_d643] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l199_c7_d643_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_d643_cond;
     tmp16_MUX_uxn_opcodes_h_l199_c7_d643_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_d643_iftrue;
     tmp16_MUX_uxn_opcodes_h_l199_c7_d643_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_d643_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_d643_return_output := tmp16_MUX_uxn_opcodes_h_l199_c7_d643_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_83d4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_8248_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_11d6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_d643_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l188_c7_83d4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l188_c7_83d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l181_c7_f4df] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l193_c7_b4d7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_cond;
     tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output := tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l188_c7_83d4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l204_c7_8248] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l204_c7_8248_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_8248_cond;
     result_pc_MUX_uxn_opcodes_h_l204_c7_8248_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_8248_iftrue;
     result_pc_MUX_uxn_opcodes_h_l204_c7_8248_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_8248_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_8248_return_output := result_pc_MUX_uxn_opcodes_h_l204_c7_8248_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l188_c7_83d4] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_83d4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_83d4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_83d4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_d643_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_8248_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_83d4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l181_c7_f4df] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l173_c2_cb59] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l199_c7_d643] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l199_c7_d643_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_d643_cond;
     result_pc_MUX_uxn_opcodes_h_l199_c7_d643_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_d643_iftrue;
     result_pc_MUX_uxn_opcodes_h_l199_c7_d643_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_d643_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_d643_return_output := result_pc_MUX_uxn_opcodes_h_l199_c7_d643_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l181_c7_f4df] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l181_c7_f4df] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_return_output := result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l188_c7_83d4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_cond;
     tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_return_output := tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l181_c7_f4df] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_d643_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_83d4_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l181_c7_f4df] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_cond;
     tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue;
     tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_return_output := tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l173_c2_cb59] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_return_output := result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l193_c7_b4d7] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_cond;
     result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_iftrue;
     result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output := result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l173_c2_cb59] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l173_c2_cb59] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l173_c2_cb59] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_return_output;

     -- Submodule level 9
     VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_b4d7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l173_c2_cb59] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_cond;
     tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue;
     tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_return_output := tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l188_c7_83d4] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_cond;
     result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_iftrue;
     result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_return_output := result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_return_output;

     -- Submodule level 10
     VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_83d4_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_cb59_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l181_c7_f4df] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_cond;
     result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_iftrue;
     result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_return_output := result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;

     -- Submodule level 11
     VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f4df_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l173_c2_cb59] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_cond;
     result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_iftrue;
     result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_return_output := result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3ddb_uxn_opcodes_h_l228_l169_DUPLICATE_e2fe LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3ddb_uxn_opcodes_h_l228_l169_DUPLICATE_e2fe_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3ddb(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_cb59_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_cb59_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3ddb_uxn_opcodes_h_l228_l169_DUPLICATE_e2fe_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3ddb_uxn_opcodes_h_l228_l169_DUPLICATE_e2fe_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
