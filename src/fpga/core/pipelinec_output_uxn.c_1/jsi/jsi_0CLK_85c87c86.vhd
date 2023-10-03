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
-- BIN_OP_EQ[uxn_opcodes_h_l173_c6_51c9]
signal BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l173_c1_2e06]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l173_c2_427b]
signal tmp16_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l173_c2_427b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l173_c2_427b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l173_c2_427b]
signal result_pc_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l173_c2_427b]
signal result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l173_c2_427b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l173_c2_427b]
signal result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l173_c2_427b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l173_c2_427b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_return_output : signed(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l173_c2_427b]
signal result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l173_c2_427b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l173_c2_427b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l173_c2_427b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l173_c2_427b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l174_c3_ae3a[uxn_opcodes_h_l174_c3_ae3a]
signal printf_uxn_opcodes_h_l174_c3_ae3a_uxn_opcodes_h_l174_c3_ae3a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l177_c11_a0e7]
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c11_a0e7_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c11_a0e7_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c11_a0e7_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l181_c11_f5b2]
signal BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l181_c7_83ff]
signal tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l181_c7_83ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l181_c7_83ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l181_c7_83ff]
signal result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l181_c7_83ff]
signal result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l181_c7_83ff]
signal result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l181_c7_83ff]
signal result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l181_c7_83ff]
signal result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l181_c7_83ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l181_c7_83ff]
signal result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l181_c7_83ff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l181_c7_83ff]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l188_c11_c7ad]
signal BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l188_c7_5ad8]
signal tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l188_c7_5ad8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l188_c7_5ad8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l188_c7_5ad8]
signal result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l188_c7_5ad8]
signal result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l188_c7_5ad8]
signal result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l188_c7_5ad8]
signal result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l188_c7_5ad8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l188_c7_5ad8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l188_c7_5ad8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l191_c34_6b23]
signal CONST_SR_8_uxn_opcodes_h_l191_c34_6b23_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l191_c34_6b23_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l193_c11_9c4d]
signal BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l193_c7_aad8]
signal tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l193_c7_aad8]
signal result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l193_c7_aad8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l193_c7_aad8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l193_c7_aad8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l193_c7_aad8]
signal result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l193_c7_aad8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l193_c7_aad8]
signal result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l199_c11_502e]
signal BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l199_c7_f9dc]
signal tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l199_c7_f9dc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l199_c7_f9dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l199_c7_f9dc]
signal result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l199_c7_f9dc]
signal result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l199_c7_f9dc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l199_c7_f9dc]
signal result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l204_c11_80a1]
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l204_c7_2f35]
signal tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l204_c7_2f35]
signal result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l204_c7_2f35]
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l204_c7_2f35]
signal result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l204_c7_2f35]
signal result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l204_c7_2f35]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l204_c7_2f35]
signal result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l206_c3_2e1b]
signal CONST_SL_8_uxn_opcodes_h_l206_c3_2e1b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l206_c3_2e1b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l209_c21_355e]
signal BIN_OP_PLUS_uxn_opcodes_h_l209_c21_355e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l209_c21_355e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l209_c21_355e_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l211_c11_f057]
signal BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l211_c7_055b]
signal tmp16_MUX_uxn_opcodes_h_l211_c7_055b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l211_c7_055b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l211_c7_055b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l211_c7_055b_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l211_c7_055b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l211_c7_055b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l211_c7_055b]
signal result_pc_MUX_uxn_opcodes_h_l211_c7_055b_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l211_c7_055b_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l211_c7_055b_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l211_c7_055b_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l211_c7_055b]
signal result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l211_c7_055b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l211_c7_055b]
signal result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l214_c21_6215]
signal BIN_OP_PLUS_uxn_opcodes_h_l214_c21_6215_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l214_c21_6215_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l214_c21_6215_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l216_c11_7d21]
signal BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l216_c7_a00a]
signal tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l216_c7_a00a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l216_c7_a00a]
signal result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l216_c7_a00a]
signal result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l216_c7_a00a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l216_c7_a00a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l217_c3_28dd]
signal BIN_OP_OR_uxn_opcodes_h_l217_c3_28dd_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l217_c3_28dd_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l217_c3_28dd_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l221_c15_80d6]
signal BIN_OP_PLUS_uxn_opcodes_h_l221_c15_80d6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l221_c15_80d6_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l221_c15_80d6_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l221_c15_7625]
signal BIN_OP_PLUS_uxn_opcodes_h_l221_c15_7625_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l221_c15_7625_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l221_c15_7625_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5ebc( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned;
 ref_toks_13 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.pc := ref_toks_3;
      base.ram_addr := ref_toks_4;
      base.is_stack_read := ref_toks_5;
      base.stack_value := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_ram_read := ref_toks_9;
      base.stack_address_sp_offset := ref_toks_10;
      base.is_ram_write := ref_toks_11;
      base.is_sp_shift := ref_toks_12;
      base.is_pc_updated := ref_toks_13;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9
BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_left,
BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_right,
BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_return_output);

-- tmp16_MUX_uxn_opcodes_h_l173_c2_427b
tmp16_MUX_uxn_opcodes_h_l173_c2_427b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l173_c2_427b_cond,
tmp16_MUX_uxn_opcodes_h_l173_c2_427b_iftrue,
tmp16_MUX_uxn_opcodes_h_l173_c2_427b_iffalse,
tmp16_MUX_uxn_opcodes_h_l173_c2_427b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b
result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b
result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_return_output);

-- result_pc_MUX_uxn_opcodes_h_l173_c2_427b
result_pc_MUX_uxn_opcodes_h_l173_c2_427b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l173_c2_427b_cond,
result_pc_MUX_uxn_opcodes_h_l173_c2_427b_iftrue,
result_pc_MUX_uxn_opcodes_h_l173_c2_427b_iffalse,
result_pc_MUX_uxn_opcodes_h_l173_c2_427b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b
result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b
result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b
result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_cond,
result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b
result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b
result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b
result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b
result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b
result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_return_output);

-- printf_uxn_opcodes_h_l174_c3_ae3a_uxn_opcodes_h_l174_c3_ae3a
printf_uxn_opcodes_h_l174_c3_ae3a_uxn_opcodes_h_l174_c3_ae3a : entity work.printf_uxn_opcodes_h_l174_c3_ae3a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l174_c3_ae3a_uxn_opcodes_h_l174_c3_ae3a_CLOCK_ENABLE);

-- BIN_OP_PLUS_uxn_opcodes_h_l177_c11_a0e7
BIN_OP_PLUS_uxn_opcodes_h_l177_c11_a0e7 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l177_c11_a0e7_left,
BIN_OP_PLUS_uxn_opcodes_h_l177_c11_a0e7_right,
BIN_OP_PLUS_uxn_opcodes_h_l177_c11_a0e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2
BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_left,
BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_right,
BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l181_c7_83ff
tmp16_MUX_uxn_opcodes_h_l181_c7_83ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_cond,
tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue,
tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse,
tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff
result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff
result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_return_output);

-- result_pc_MUX_uxn_opcodes_h_l181_c7_83ff
result_pc_MUX_uxn_opcodes_h_l181_c7_83ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_cond,
result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue,
result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse,
result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff
result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_cond,
result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff
result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_cond,
result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff
result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff
result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff
result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff
result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff
result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad
BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_left,
BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_right,
BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_return_output);

-- tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8
tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_cond,
tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue,
tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse,
tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8
result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8
result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output);

-- result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8
result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_cond,
result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue,
result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse,
result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8
result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_cond,
result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8
result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_cond,
result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8
result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8
result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8
result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l191_c34_6b23
CONST_SR_8_uxn_opcodes_h_l191_c34_6b23 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l191_c34_6b23_x,
CONST_SR_8_uxn_opcodes_h_l191_c34_6b23_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d
BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_left,
BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_right,
BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l193_c7_aad8
tmp16_MUX_uxn_opcodes_h_l193_c7_aad8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_cond,
tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue,
tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse,
tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8
result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_cond,
result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8
result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_return_output);

-- result_pc_MUX_uxn_opcodes_h_l193_c7_aad8
result_pc_MUX_uxn_opcodes_h_l193_c7_aad8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_cond,
result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue,
result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse,
result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8
result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e
BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_left,
BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_right,
BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc
tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_cond,
tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue,
tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse,
tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc
result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc
result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output);

-- result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc
result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_cond,
result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue,
result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse,
result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc
result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_cond,
result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc
result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc
result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1
BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_left,
BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_right,
BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l204_c7_2f35
tmp16_MUX_uxn_opcodes_h_l204_c7_2f35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_cond,
tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue,
tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse,
tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35
result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_return_output);

-- result_pc_MUX_uxn_opcodes_h_l204_c7_2f35
result_pc_MUX_uxn_opcodes_h_l204_c7_2f35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_cond,
result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue,
result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse,
result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35
result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_cond,
result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35
result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_return_output);

-- CONST_SL_8_uxn_opcodes_h_l206_c3_2e1b
CONST_SL_8_uxn_opcodes_h_l206_c3_2e1b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l206_c3_2e1b_x,
CONST_SL_8_uxn_opcodes_h_l206_c3_2e1b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l209_c21_355e
BIN_OP_PLUS_uxn_opcodes_h_l209_c21_355e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l209_c21_355e_left,
BIN_OP_PLUS_uxn_opcodes_h_l209_c21_355e_right,
BIN_OP_PLUS_uxn_opcodes_h_l209_c21_355e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057
BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_left,
BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_right,
BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_return_output);

-- tmp16_MUX_uxn_opcodes_h_l211_c7_055b
tmp16_MUX_uxn_opcodes_h_l211_c7_055b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l211_c7_055b_cond,
tmp16_MUX_uxn_opcodes_h_l211_c7_055b_iftrue,
tmp16_MUX_uxn_opcodes_h_l211_c7_055b_iffalse,
tmp16_MUX_uxn_opcodes_h_l211_c7_055b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b
result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b
result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_return_output);

-- result_pc_MUX_uxn_opcodes_h_l211_c7_055b
result_pc_MUX_uxn_opcodes_h_l211_c7_055b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l211_c7_055b_cond,
result_pc_MUX_uxn_opcodes_h_l211_c7_055b_iftrue,
result_pc_MUX_uxn_opcodes_h_l211_c7_055b_iffalse,
result_pc_MUX_uxn_opcodes_h_l211_c7_055b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b
result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b
result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b
result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l214_c21_6215
BIN_OP_PLUS_uxn_opcodes_h_l214_c21_6215 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l214_c21_6215_left,
BIN_OP_PLUS_uxn_opcodes_h_l214_c21_6215_right,
BIN_OP_PLUS_uxn_opcodes_h_l214_c21_6215_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21
BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_left,
BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_right,
BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_return_output);

-- tmp16_MUX_uxn_opcodes_h_l216_c7_a00a
tmp16_MUX_uxn_opcodes_h_l216_c7_a00a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_cond,
tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue,
tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse,
tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a
result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l216_c7_a00a
result_pc_MUX_uxn_opcodes_h_l216_c7_a00a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_cond,
result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue,
result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse,
result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a
result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a
result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a
result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l217_c3_28dd
BIN_OP_OR_uxn_opcodes_h_l217_c3_28dd : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l217_c3_28dd_left,
BIN_OP_OR_uxn_opcodes_h_l217_c3_28dd_right,
BIN_OP_OR_uxn_opcodes_h_l217_c3_28dd_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l221_c15_80d6
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_80d6 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_80d6_left,
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_80d6_right,
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_80d6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l221_c15_7625
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_7625 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_7625_left,
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_7625_right,
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_7625_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_return_output,
 tmp16_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
 result_pc_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l177_c11_a0e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_return_output,
 tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_return_output,
 result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_return_output,
 tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output,
 result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output,
 CONST_SR_8_uxn_opcodes_h_l191_c34_6b23_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_return_output,
 tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_return_output,
 result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_return_output,
 tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output,
 result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_return_output,
 tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_return_output,
 result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_return_output,
 CONST_SL_8_uxn_opcodes_h_l206_c3_2e1b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l209_c21_355e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_return_output,
 tmp16_MUX_uxn_opcodes_h_l211_c7_055b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_return_output,
 result_pc_MUX_uxn_opcodes_h_l211_c7_055b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l214_c21_6215_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_return_output,
 tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_return_output,
 result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l217_c3_28dd_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l221_c15_80d6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l221_c15_7625_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l177_c3_d927 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l176_c3_c97d : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l173_c2_427b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l174_c3_ae3a_uxn_opcodes_h_l174_c3_ae3a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_a0e7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_a0e7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_a0e7_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l185_c3_4c61 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l181_c7_83ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l186_c24_9f50_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l190_c3_59ca : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l191_c34_6b23_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l191_c34_6b23_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l191_c24_5fc8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l202_c3_4b28 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_055b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_055b_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l209_c3_b275 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l206_c3_2e1b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l206_c3_2e1b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_355e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_355e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_355e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_055b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_055b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_055b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_055b_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_055b_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_055b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l214_c3_4fd3 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_6215_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_6215_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_6215_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l221_c3_f776 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l219_c3_7dc3 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_28dd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_28dd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_28dd_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_80d6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_80d6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_80d6_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_7625_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_7625_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_7625_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l173_l193_DUPLICATE_b5a7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l173_l211_l204_DUPLICATE_b7f4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_843e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l173_l181_DUPLICATE_63cc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l173_l188_DUPLICATE_e2c2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_c2cf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l173_l188_DUPLICATE_54c8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l199_l188_l181_l173_l211_DUPLICATE_6279_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l199_l193_l188_l181_l173_l211_l204_DUPLICATE_47a8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l211_l204_DUPLICATE_dede_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l217_l205_DUPLICATE_6946_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ebc_uxn_opcodes_h_l228_l169_DUPLICATE_6072_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_355e_right := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_6215_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_right := to_unsigned(3, 2);
     VAR_result_ram_addr_uxn_opcodes_h_l219_c3_7dc3 := resize(to_unsigned(0, 1), 16);
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l219_c3_7dc3;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_iffalse := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l190_c3_59ca := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l190_c3_59ca;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l176_c3_c97d := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l176_c3_c97d;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_a0e7_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_right := to_unsigned(4, 3);
     VAR_tmp16_uxn_opcodes_h_l202_c3_4b28 := resize(to_unsigned(0, 1), 16);
     VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue := VAR_tmp16_uxn_opcodes_h_l202_c3_4b28;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_right := to_unsigned(6, 3);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_7625_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l185_c3_4c61 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l185_c3_4c61;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_a0e7_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_355e_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_6215_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_80d6_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_28dd_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l191_c34_6b23_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_055b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse := tmp16;
     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l181_c7_83ff] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l181_c7_83ff_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l211_c11_f057] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_left;
     BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_return_output := BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l173_l193_DUPLICATE_b5a7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l173_l193_DUPLICATE_b5a7_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l199_l188_l181_l173_l211_DUPLICATE_6279 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l199_l188_l181_l173_l211_DUPLICATE_6279_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_c2cf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_c2cf_return_output := result.is_ram_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l199_l193_l188_l181_l173_l211_l204_DUPLICATE_47a8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l199_l193_l188_l181_l173_l211_l204_DUPLICATE_47a8_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l211_l204_DUPLICATE_dede LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l211_l204_DUPLICATE_dede_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l173_l211_l204_DUPLICATE_b7f4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l173_l211_l204_DUPLICATE_b7f4_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l193_c11_9c4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l188_c11_c7ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l217_l205_DUPLICATE_6946 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l217_l205_DUPLICATE_6946_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l173_c2_427b] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l173_c2_427b_return_output := result.is_stack_index_flipped;

     -- BIN_OP_PLUS[uxn_opcodes_h_l214_c21_6215] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l214_c21_6215_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_6215_left;
     BIN_OP_PLUS_uxn_opcodes_h_l214_c21_6215_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_6215_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_6215_return_output := BIN_OP_PLUS_uxn_opcodes_h_l214_c21_6215_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l173_c2_427b] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l173_c2_427b_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l173_c6_51c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l216_c11_7d21] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_left;
     BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_return_output := BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l186_c24_9f50] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l186_c24_9f50_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l204_c11_80a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l181_c11_f5b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l199_c11_502e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_left;
     BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_return_output := BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l209_c21_355e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l209_c21_355e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_355e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l209_c21_355e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_355e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_355e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l209_c21_355e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l173_l188_DUPLICATE_54c8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l173_l188_DUPLICATE_54c8_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l191_c34_6b23] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l191_c34_6b23_x <= VAR_CONST_SR_8_uxn_opcodes_h_l191_c34_6b23_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l191_c34_6b23_return_output := CONST_SR_8_uxn_opcodes_h_l191_c34_6b23_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_843e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_843e_return_output := result.ram_addr;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l173_l188_DUPLICATE_e2c2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l173_l188_DUPLICATE_e2c2_return_output := result.stack_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l177_c11_a0e7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l177_c11_a0e7_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_a0e7_left;
     BIN_OP_PLUS_uxn_opcodes_h_l177_c11_a0e7_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_a0e7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_a0e7_return_output := BIN_OP_PLUS_uxn_opcodes_h_l177_c11_a0e7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l173_l181_DUPLICATE_63cc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l173_l181_DUPLICATE_63cc_return_output := result.is_stack_read;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_427b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_427b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_51c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_f5b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_c7ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_9c4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_502e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_80a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_055b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_055b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_f057_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_7d21_return_output;
     VAR_tmp16_uxn_opcodes_h_l177_c3_d927 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_a0e7_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l209_c3_b275 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_355e_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l214_c3_4fd3 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_6215_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_28dd_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l217_l205_DUPLICATE_6946_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l206_c3_2e1b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l217_l205_DUPLICATE_6946_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l186_c24_9f50_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_427b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l173_l211_l204_DUPLICATE_b7f4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l173_l211_l204_DUPLICATE_b7f4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l173_l211_l204_DUPLICATE_b7f4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l173_l211_l204_DUPLICATE_b7f4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l173_l211_l204_DUPLICATE_b7f4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l173_l211_l204_DUPLICATE_b7f4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_055b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l173_l211_l204_DUPLICATE_b7f4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l173_l211_l204_DUPLICATE_b7f4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_843e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_843e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_843e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_843e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l211_l204_DUPLICATE_dede_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l211_l204_DUPLICATE_dede_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l211_l204_DUPLICATE_dede_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l211_l204_DUPLICATE_dede_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l211_l204_DUPLICATE_dede_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l211_l204_DUPLICATE_dede_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l199_l193_l188_l181_l216_l211_l204_DUPLICATE_dede_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l199_l193_l188_l181_l173_l211_l204_DUPLICATE_47a8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l199_l193_l188_l181_l173_l211_l204_DUPLICATE_47a8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l199_l193_l188_l181_l173_l211_l204_DUPLICATE_47a8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l199_l193_l188_l181_l173_l211_l204_DUPLICATE_47a8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l199_l193_l188_l181_l173_l211_l204_DUPLICATE_47a8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l199_l193_l188_l181_l173_l211_l204_DUPLICATE_47a8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l199_l193_l188_l181_l173_l211_l204_DUPLICATE_47a8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_c2cf_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_c2cf_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_c2cf_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l173_l181_l216_l188_DUPLICATE_c2cf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l199_l188_l181_l173_l211_DUPLICATE_6279_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l199_l188_l181_l173_l211_DUPLICATE_6279_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l199_l188_l181_l173_l211_DUPLICATE_6279_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l199_l188_l181_l173_l211_DUPLICATE_6279_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l199_l188_l181_l173_l211_DUPLICATE_6279_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l173_l181_DUPLICATE_63cc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l173_l181_DUPLICATE_63cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l173_l193_DUPLICATE_b5a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l173_l193_DUPLICATE_b5a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l173_l188_DUPLICATE_54c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l173_l188_DUPLICATE_54c8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l173_l188_DUPLICATE_e2c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l173_l188_DUPLICATE_e2c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l181_c7_83ff_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l173_c2_427b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l173_c2_427b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l209_c3_b275;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l214_c3_4fd3;
     VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_427b_iftrue := VAR_tmp16_uxn_opcodes_h_l177_c3_d927;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l216_c7_a00a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l206_c3_2e1b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l206_c3_2e1b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l206_c3_2e1b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l206_c3_2e1b_return_output := CONST_SL_8_uxn_opcodes_h_l206_c3_2e1b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l211_c7_055b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l191_c24_5fc8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l191_c24_5fc8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l191_c34_6b23_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l173_c1_2e06] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l173_c2_427b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l193_c7_aad8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l173_c2_427b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l181_c7_83ff] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l188_c7_5ad8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l217_c3_28dd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l217_c3_28dd_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_28dd_left;
     BIN_OP_OR_uxn_opcodes_h_l217_c3_28dd_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_28dd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_28dd_return_output := BIN_OP_OR_uxn_opcodes_h_l217_c3_28dd_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l216_c7_a00a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l216_c7_a00a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l216_c7_a00a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l181_c7_83ff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_80d6_right := VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_28dd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_28dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l191_c24_5fc8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l206_c3_2e1b_return_output;
     VAR_printf_uxn_opcodes_h_l174_c3_ae3a_uxn_opcodes_h_l174_c3_ae3a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_2e06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_a00a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_a00a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_a00a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_055b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_aad8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_a00a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l211_c7_055b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l211_c7_055b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l181_c7_83ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l221_c15_80d6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l221_c15_80d6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_80d6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l221_c15_80d6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_80d6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_80d6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l221_c15_80d6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l211_c7_055b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l173_c2_427b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l204_c7_2f35] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l211_c7_055b] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_return_output;

     -- printf_uxn_opcodes_h_l174_c3_ae3a[uxn_opcodes_h_l174_c3_ae3a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l174_c3_ae3a_uxn_opcodes_h_l174_c3_ae3a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l174_c3_ae3a_uxn_opcodes_h_l174_c3_ae3a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- tmp16_MUX[uxn_opcodes_h_l216_c7_a00a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_cond;
     tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_return_output := tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l188_c7_5ad8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output := result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l173_c2_427b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l188_c7_5ad8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_7625_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_80d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_055b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_055b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_055b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_2f35_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_055b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_055b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_a00a_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l211_c7_055b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l211_c7_055b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_055b_cond;
     tmp16_MUX_uxn_opcodes_h_l211_c7_055b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_055b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l211_c7_055b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_055b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_055b_return_output := tmp16_MUX_uxn_opcodes_h_l211_c7_055b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l204_c7_2f35] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_return_output := result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l204_c7_2f35] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l181_c7_83ff] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_cond;
     result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_return_output := result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l173_c2_427b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l199_c7_f9dc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l204_c7_2f35] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l204_c7_2f35] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l221_c15_7625] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l221_c15_7625_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_7625_left;
     BIN_OP_PLUS_uxn_opcodes_h_l221_c15_7625_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_7625_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_7625_return_output := BIN_OP_PLUS_uxn_opcodes_h_l221_c15_7625_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l181_c7_83ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l221_c3_f776 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_7625_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2f35_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2f35_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_2f35_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_2f35_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_055b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue := VAR_result_pc_uxn_opcodes_h_l221_c3_f776;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l199_c7_f9dc] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l193_c7_aad8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l173_c2_427b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_return_output := result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l204_c7_2f35] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_cond;
     tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue;
     tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_return_output := tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l199_c7_f9dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l173_c2_427b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l199_c7_f9dc] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output := result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l199_c7_f9dc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l216_c7_a00a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_cond;
     result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_return_output := result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_aad8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_055b_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_a00a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_2f35_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l211_c7_055b] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l211_c7_055b_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_055b_cond;
     result_pc_MUX_uxn_opcodes_h_l211_c7_055b_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_055b_iftrue;
     result_pc_MUX_uxn_opcodes_h_l211_c7_055b_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_055b_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_055b_return_output := result_pc_MUX_uxn_opcodes_h_l211_c7_055b_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l193_c7_aad8] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l188_c7_5ad8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l193_c7_aad8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l199_c7_f9dc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_cond;
     tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output := tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l193_c7_aad8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l193_c7_aad8] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_return_output := result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_aad8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_aad8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_aad8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_055b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_aad8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l188_c7_5ad8] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l188_c7_5ad8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l204_c7_2f35] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_cond;
     result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_iftrue;
     result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_return_output := result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l188_c7_5ad8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l193_c7_aad8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_cond;
     tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_return_output := tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l188_c7_5ad8] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output := result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l181_c7_83ff] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_2f35_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_aad8_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l181_c7_83ff] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_return_output := result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l181_c7_83ff] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l188_c7_5ad8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_cond;
     tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output := tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l181_c7_83ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l181_c7_83ff] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l173_c2_427b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l199_c7_f9dc] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_cond;
     result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_iftrue;
     result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output := result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_f9dc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l181_c7_83ff] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_cond;
     tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue;
     tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_return_output := tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l173_c2_427b] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l193_c7_aad8] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_cond;
     result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_iftrue;
     result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_return_output := result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l173_c2_427b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l173_c2_427b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l173_c2_427b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_return_output;

     -- Submodule level 9
     VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_aad8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_427b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l188_c7_5ad8] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_cond;
     result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_iftrue;
     result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output := result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l173_c2_427b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l173_c2_427b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_427b_cond;
     tmp16_MUX_uxn_opcodes_h_l173_c2_427b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_427b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l173_c2_427b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_427b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_427b_return_output := tmp16_MUX_uxn_opcodes_h_l173_c2_427b_return_output;

     -- Submodule level 10
     VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_5ad8_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_427b_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l181_c7_83ff] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_cond;
     result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_iftrue;
     result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_return_output := result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;

     -- Submodule level 11
     VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_427b_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_83ff_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l173_c2_427b] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l173_c2_427b_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_427b_cond;
     result_pc_MUX_uxn_opcodes_h_l173_c2_427b_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_427b_iftrue;
     result_pc_MUX_uxn_opcodes_h_l173_c2_427b_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_427b_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_427b_return_output := result_pc_MUX_uxn_opcodes_h_l173_c2_427b_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5ebc_uxn_opcodes_h_l228_l169_DUPLICATE_6072 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ebc_uxn_opcodes_h_l228_l169_DUPLICATE_6072_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5ebc(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_427b_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_427b_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ebc_uxn_opcodes_h_l228_l169_DUPLICATE_6072_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ebc_uxn_opcodes_h_l228_l169_DUPLICATE_6072_return_output;
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
