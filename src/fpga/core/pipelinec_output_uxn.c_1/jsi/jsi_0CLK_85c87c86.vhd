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
-- BIN_OP_EQ[uxn_opcodes_h_l173_c6_b4dc]
signal BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l173_c1_8bf3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l173_c2_84c3]
signal tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l173_c2_84c3]
signal result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l173_c2_84c3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l173_c2_84c3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l173_c2_84c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l173_c2_84c3]
signal result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l173_c2_84c3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l173_c2_84c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l173_c2_84c3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l173_c2_84c3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l173_c2_84c3]
signal result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l173_c2_84c3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l173_c2_84c3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l173_c2_84c3]
signal result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l174_c3_1690[uxn_opcodes_h_l174_c3_1690]
signal printf_uxn_opcodes_h_l174_c3_1690_uxn_opcodes_h_l174_c3_1690_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l177_c11_8a5a]
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c11_8a5a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c11_8a5a_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c11_8a5a_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l181_c11_7143]
signal BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l181_c7_f92c]
signal tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l181_c7_f92c]
signal result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l181_c7_f92c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l181_c7_f92c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l181_c7_f92c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l181_c7_f92c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l181_c7_f92c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l181_c7_f92c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l181_c7_f92c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l181_c7_f92c]
signal result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l181_c7_f92c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l181_c7_f92c]
signal result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l188_c11_0272]
signal BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l188_c7_b6e6]
signal tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l188_c7_b6e6]
signal result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l188_c7_b6e6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l188_c7_b6e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l188_c7_b6e6]
signal result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l188_c7_b6e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l188_c7_b6e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l188_c7_b6e6]
signal result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l188_c7_b6e6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l188_c7_b6e6]
signal result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l191_c34_38eb]
signal CONST_SR_8_uxn_opcodes_h_l191_c34_38eb_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l191_c34_38eb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l193_c11_d989]
signal BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l193_c7_df31]
signal tmp16_MUX_uxn_opcodes_h_l193_c7_df31_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l193_c7_df31_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l193_c7_df31_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l193_c7_df31_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l193_c7_df31]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l193_c7_df31]
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l193_c7_df31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l193_c7_df31]
signal result_pc_MUX_uxn_opcodes_h_l193_c7_df31_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l193_c7_df31_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l193_c7_df31_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l193_c7_df31_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l193_c7_df31]
signal result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l193_c7_df31]
signal result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l193_c7_df31]
signal result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l199_c11_7e46]
signal BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l199_c7_9856]
signal tmp16_MUX_uxn_opcodes_h_l199_c7_9856_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l199_c7_9856_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l199_c7_9856_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l199_c7_9856_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l199_c7_9856]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l199_c7_9856]
signal result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l199_c7_9856]
signal result_pc_MUX_uxn_opcodes_h_l199_c7_9856_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l199_c7_9856_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l199_c7_9856_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l199_c7_9856_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l199_c7_9856]
signal result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l199_c7_9856]
signal result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l199_c7_9856]
signal result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l204_c11_ef93]
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l204_c7_4b0b]
signal tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l204_c7_4b0b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l204_c7_4b0b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l204_c7_4b0b]
signal result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l204_c7_4b0b]
signal result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l204_c7_4b0b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l204_c7_4b0b]
signal result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l206_c3_11fa]
signal CONST_SL_8_uxn_opcodes_h_l206_c3_11fa_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l206_c3_11fa_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l209_c21_ed7b]
signal BIN_OP_PLUS_uxn_opcodes_h_l209_c21_ed7b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l209_c21_ed7b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l209_c21_ed7b_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l211_c11_3cc1]
signal BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l211_c7_6914]
signal tmp16_MUX_uxn_opcodes_h_l211_c7_6914_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l211_c7_6914_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l211_c7_6914_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l211_c7_6914_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l211_c7_6914]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l211_c7_6914]
signal result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l211_c7_6914]
signal result_pc_MUX_uxn_opcodes_h_l211_c7_6914_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l211_c7_6914_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l211_c7_6914_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l211_c7_6914_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l211_c7_6914]
signal result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l211_c7_6914]
signal result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l211_c7_6914]
signal result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l214_c21_14ee]
signal BIN_OP_PLUS_uxn_opcodes_h_l214_c21_14ee_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l214_c21_14ee_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l214_c21_14ee_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l216_c11_898f]
signal BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l216_c7_5bca]
signal tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l216_c7_5bca]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l216_c7_5bca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l216_c7_5bca]
signal result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l216_c7_5bca]
signal result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l216_c7_5bca]
signal result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l217_c3_1a97]
signal BIN_OP_OR_uxn_opcodes_h_l217_c3_1a97_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l217_c3_1a97_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l217_c3_1a97_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l221_c15_cf0e]
signal BIN_OP_PLUS_uxn_opcodes_h_l221_c15_cf0e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l221_c15_cf0e_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l221_c15_cf0e_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l221_c15_0cf0]
signal BIN_OP_PLUS_uxn_opcodes_h_l221_c15_0cf0_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l221_c15_0cf0_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l221_c15_0cf0_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_2f03( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : signed;
 ref_toks_13 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_read := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_ram_read := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_sp_shift := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.pc := ref_toks_10;
      base.is_ram_write := ref_toks_11;
      base.sp_relative_shift := ref_toks_12;
      base.ram_addr := ref_toks_13;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc
BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_left,
BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_right,
BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l173_c2_84c3
tmp16_MUX_uxn_opcodes_h_l173_c2_84c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_cond,
tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue,
tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse,
tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3
result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_cond,
result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3
result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3
result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3
result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3
result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3
result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3
result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_return_output);

-- result_pc_MUX_uxn_opcodes_h_l173_c2_84c3
result_pc_MUX_uxn_opcodes_h_l173_c2_84c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_cond,
result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue,
result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse,
result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3
result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3
result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3
result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_return_output);

-- printf_uxn_opcodes_h_l174_c3_1690_uxn_opcodes_h_l174_c3_1690
printf_uxn_opcodes_h_l174_c3_1690_uxn_opcodes_h_l174_c3_1690 : entity work.printf_uxn_opcodes_h_l174_c3_1690_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l174_c3_1690_uxn_opcodes_h_l174_c3_1690_CLOCK_ENABLE);

-- BIN_OP_PLUS_uxn_opcodes_h_l177_c11_8a5a
BIN_OP_PLUS_uxn_opcodes_h_l177_c11_8a5a : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l177_c11_8a5a_left,
BIN_OP_PLUS_uxn_opcodes_h_l177_c11_8a5a_right,
BIN_OP_PLUS_uxn_opcodes_h_l177_c11_8a5a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143
BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_left,
BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_right,
BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_return_output);

-- tmp16_MUX_uxn_opcodes_h_l181_c7_f92c
tmp16_MUX_uxn_opcodes_h_l181_c7_f92c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_cond,
tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue,
tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse,
tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c
result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_cond,
result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c
result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c
result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c
result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c
result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c
result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c
result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l181_c7_f92c
result_pc_MUX_uxn_opcodes_h_l181_c7_f92c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_cond,
result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue,
result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse,
result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c
result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c
result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272
BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_left,
BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_right,
BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_return_output);

-- tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6
tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_cond,
tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue,
tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse,
tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6
result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_cond,
result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6
result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6
result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6
result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6
result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output);

-- result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6
result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_cond,
result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue,
result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse,
result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6
result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6
result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output);

-- CONST_SR_8_uxn_opcodes_h_l191_c34_38eb
CONST_SR_8_uxn_opcodes_h_l191_c34_38eb : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l191_c34_38eb_x,
CONST_SR_8_uxn_opcodes_h_l191_c34_38eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989
BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_left,
BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_right,
BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_return_output);

-- tmp16_MUX_uxn_opcodes_h_l193_c7_df31
tmp16_MUX_uxn_opcodes_h_l193_c7_df31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l193_c7_df31_cond,
tmp16_MUX_uxn_opcodes_h_l193_c7_df31_iftrue,
tmp16_MUX_uxn_opcodes_h_l193_c7_df31_iffalse,
tmp16_MUX_uxn_opcodes_h_l193_c7_df31_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_return_output);

-- result_pc_MUX_uxn_opcodes_h_l193_c7_df31
result_pc_MUX_uxn_opcodes_h_l193_c7_df31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l193_c7_df31_cond,
result_pc_MUX_uxn_opcodes_h_l193_c7_df31_iftrue,
result_pc_MUX_uxn_opcodes_h_l193_c7_df31_iffalse,
result_pc_MUX_uxn_opcodes_h_l193_c7_df31_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31
result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31
result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31
result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_cond,
result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46
BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_left,
BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_right,
BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_return_output);

-- tmp16_MUX_uxn_opcodes_h_l199_c7_9856
tmp16_MUX_uxn_opcodes_h_l199_c7_9856 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l199_c7_9856_cond,
tmp16_MUX_uxn_opcodes_h_l199_c7_9856_iftrue,
tmp16_MUX_uxn_opcodes_h_l199_c7_9856_iffalse,
tmp16_MUX_uxn_opcodes_h_l199_c7_9856_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856
result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856
result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_return_output);

-- result_pc_MUX_uxn_opcodes_h_l199_c7_9856
result_pc_MUX_uxn_opcodes_h_l199_c7_9856 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l199_c7_9856_cond,
result_pc_MUX_uxn_opcodes_h_l199_c7_9856_iftrue,
result_pc_MUX_uxn_opcodes_h_l199_c7_9856_iffalse,
result_pc_MUX_uxn_opcodes_h_l199_c7_9856_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856
result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856
result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856
result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_cond,
result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93
BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_left,
BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_right,
BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_return_output);

-- tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b
tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_cond,
tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue,
tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse,
tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output);

-- result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b
result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_cond,
result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue,
result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse,
result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b
result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b
result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b
result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l206_c3_11fa
CONST_SL_8_uxn_opcodes_h_l206_c3_11fa : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l206_c3_11fa_x,
CONST_SL_8_uxn_opcodes_h_l206_c3_11fa_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l209_c21_ed7b
BIN_OP_PLUS_uxn_opcodes_h_l209_c21_ed7b : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l209_c21_ed7b_left,
BIN_OP_PLUS_uxn_opcodes_h_l209_c21_ed7b_right,
BIN_OP_PLUS_uxn_opcodes_h_l209_c21_ed7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1
BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_left,
BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_right,
BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l211_c7_6914
tmp16_MUX_uxn_opcodes_h_l211_c7_6914 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l211_c7_6914_cond,
tmp16_MUX_uxn_opcodes_h_l211_c7_6914_iftrue,
tmp16_MUX_uxn_opcodes_h_l211_c7_6914_iffalse,
tmp16_MUX_uxn_opcodes_h_l211_c7_6914_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914
result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914
result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_return_output);

-- result_pc_MUX_uxn_opcodes_h_l211_c7_6914
result_pc_MUX_uxn_opcodes_h_l211_c7_6914 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l211_c7_6914_cond,
result_pc_MUX_uxn_opcodes_h_l211_c7_6914_iftrue,
result_pc_MUX_uxn_opcodes_h_l211_c7_6914_iffalse,
result_pc_MUX_uxn_opcodes_h_l211_c7_6914_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914
result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914
result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914
result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_cond,
result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l214_c21_14ee
BIN_OP_PLUS_uxn_opcodes_h_l214_c21_14ee : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l214_c21_14ee_left,
BIN_OP_PLUS_uxn_opcodes_h_l214_c21_14ee_right,
BIN_OP_PLUS_uxn_opcodes_h_l214_c21_14ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f
BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_left,
BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_right,
BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l216_c7_5bca
tmp16_MUX_uxn_opcodes_h_l216_c7_5bca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_cond,
tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue,
tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse,
tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca
result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca
result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_return_output);

-- result_pc_MUX_uxn_opcodes_h_l216_c7_5bca
result_pc_MUX_uxn_opcodes_h_l216_c7_5bca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_cond,
result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue,
result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse,
result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca
result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca
result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_cond,
result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l217_c3_1a97
BIN_OP_OR_uxn_opcodes_h_l217_c3_1a97 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l217_c3_1a97_left,
BIN_OP_OR_uxn_opcodes_h_l217_c3_1a97_right,
BIN_OP_OR_uxn_opcodes_h_l217_c3_1a97_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l221_c15_cf0e
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_cf0e : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_cf0e_left,
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_cf0e_right,
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_cf0e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l221_c15_0cf0
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_0cf0 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_0cf0_left,
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_0cf0_right,
BIN_OP_PLUS_uxn_opcodes_h_l221_c15_0cf0_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_return_output,
 tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
 result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l177_c11_8a5a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_return_output,
 tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_return_output,
 result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_return_output,
 tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output,
 result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output,
 CONST_SR_8_uxn_opcodes_h_l191_c34_38eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_return_output,
 tmp16_MUX_uxn_opcodes_h_l193_c7_df31_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_return_output,
 result_pc_MUX_uxn_opcodes_h_l193_c7_df31_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_return_output,
 tmp16_MUX_uxn_opcodes_h_l199_c7_9856_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_return_output,
 result_pc_MUX_uxn_opcodes_h_l199_c7_9856_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_return_output,
 tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output,
 result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output,
 CONST_SL_8_uxn_opcodes_h_l206_c3_11fa_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l209_c21_ed7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_return_output,
 tmp16_MUX_uxn_opcodes_h_l211_c7_6914_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_return_output,
 result_pc_MUX_uxn_opcodes_h_l211_c7_6914_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l214_c21_14ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_return_output,
 tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_return_output,
 result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_return_output,
 BIN_OP_OR_uxn_opcodes_h_l217_c3_1a97_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l221_c15_cf0e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l221_c15_0cf0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l177_c3_506b : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l176_c3_fd75 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l173_c2_84c3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l174_c3_1690_uxn_opcodes_h_l174_c3_1690_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_8a5a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_8a5a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_8a5a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l181_c7_f92c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l185_c3_be30 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l186_c24_3535_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_df31_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l190_c3_fee3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_df31_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l191_c34_38eb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l191_c34_38eb_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l191_c24_543f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_df31_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_df31_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_9856_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_df31_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_df31_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_df31_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_9856_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_df31_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_9856_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l202_c3_f73d : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_9856_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_9856_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_9856_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_9856_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_9856_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_6914_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_6914_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l209_c3_3b87 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l206_c3_11fa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l206_c3_11fa_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_ed7b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_ed7b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_ed7b_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_6914_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_6914_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_6914_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_6914_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_6914_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_6914_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l214_c3_45e9 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_14ee_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_14ee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_14ee_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l221_c3_15b5 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l219_c3_709c : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_1a97_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_1a97_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_1a97_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_cf0e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_cf0e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_cf0e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_0cf0_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_0cf0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_0cf0_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l188_l173_DUPLICATE_5170_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l193_l188_l181_l173_l211_l204_l199_DUPLICATE_3cf4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l173_l181_DUPLICATE_a5d3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l173_l193_DUPLICATE_cfce_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l216_l188_l173_l181_DUPLICATE_a2d1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l188_l173_DUPLICATE_51dd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l193_l188_l181_l216_l173_l211_l204_l199_DUPLICATE_5f2a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l188_l181_l173_l211_l199_DUPLICATE_88a5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l216_l188_l173_l181_DUPLICATE_a716_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l193_l188_l181_l216_l211_l204_l199_DUPLICATE_9f76_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l205_l217_DUPLICATE_b80c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2f03_uxn_opcodes_h_l169_l228_DUPLICATE_45ec_return_output : opcode_result_t;
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
     VAR_tmp16_uxn_opcodes_h_l202_c3_f73d := resize(to_unsigned(0, 1), 16);
     VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_9856_iftrue := VAR_tmp16_uxn_opcodes_h_l202_c3_f73d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l176_c3_fd75 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l176_c3_fd75;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse := to_unsigned(0, 1);
     VAR_result_ram_addr_uxn_opcodes_h_l219_c3_709c := resize(to_unsigned(0, 1), 16);
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l219_c3_709c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_14ee_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_0cf0_right := to_unsigned(2, 2);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l185_c3_be30 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l185_c3_be30;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_ed7b_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_8a5a_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_right := to_unsigned(6, 3);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_right := to_unsigned(3, 2);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_iffalse := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l190_c3_fee3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l190_c3_fee3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_right := to_unsigned(7, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_8a5a_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_ed7b_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_14ee_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_cf0e_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_1a97_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l191_c34_38eb_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_df31_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_6914_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l173_l181_DUPLICATE_a5d3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l173_l181_DUPLICATE_a5d3_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l173_l193_DUPLICATE_cfce LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l173_l193_DUPLICATE_cfce_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l204_c11_ef93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_left;
     BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_return_output := BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l211_c11_3cc1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_left;
     BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_return_output := BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l181_c7_f92c] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l181_c7_f92c_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l216_c11_898f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_left;
     BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_return_output := BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l188_l173_DUPLICATE_5170 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l188_l173_DUPLICATE_5170_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l188_c11_0272] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_left;
     BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_return_output := BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l214_c21_14ee] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l214_c21_14ee_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_14ee_left;
     BIN_OP_PLUS_uxn_opcodes_h_l214_c21_14ee_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_14ee_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_14ee_return_output := BIN_OP_PLUS_uxn_opcodes_h_l214_c21_14ee_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l173_c2_84c3] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l173_c2_84c3_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l181_c11_7143] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_left;
     BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_return_output := BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l209_c21_ed7b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l209_c21_ed7b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_ed7b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l209_c21_ed7b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_ed7b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_ed7b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l209_c21_ed7b_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l173_c2_84c3] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l173_c2_84c3_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l199_c11_7e46] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_left;
     BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_return_output := BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l186_c24_3535] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l186_c24_3535_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l193_l188_l181_l216_l173_l211_l204_l199_DUPLICATE_5f2a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l193_l188_l181_l216_l173_l211_l204_l199_DUPLICATE_5f2a_return_output := result.pc;

     -- BIN_OP_PLUS[uxn_opcodes_h_l177_c11_8a5a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l177_c11_8a5a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_8a5a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l177_c11_8a5a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_8a5a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_8a5a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l177_c11_8a5a_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l216_l188_l173_l181_DUPLICATE_a716 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l216_l188_l173_l181_DUPLICATE_a716_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l193_l188_l181_l173_l211_l204_l199_DUPLICATE_3cf4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l193_l188_l181_l173_l211_l204_l199_DUPLICATE_3cf4_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l173_c6_b4dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l216_l188_l173_l181_DUPLICATE_a2d1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l216_l188_l173_l181_DUPLICATE_a2d1_return_output := result.is_ram_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l188_l173_DUPLICATE_51dd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l188_l173_DUPLICATE_51dd_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l193_l188_l181_l216_l211_l204_l199_DUPLICATE_9f76 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l193_l188_l181_l216_l211_l204_l199_DUPLICATE_9f76_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l193_c11_d989] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_left;
     BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_return_output := BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l188_l181_l173_l211_l199_DUPLICATE_88a5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l188_l181_l173_l211_l199_DUPLICATE_88a5_return_output := result.is_ram_write;

     -- CONST_SR_8[uxn_opcodes_h_l191_c34_38eb] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l191_c34_38eb_x <= VAR_CONST_SR_8_uxn_opcodes_h_l191_c34_38eb_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l191_c34_38eb_return_output := CONST_SR_8_uxn_opcodes_h_l191_c34_38eb_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l205_l217_DUPLICATE_b80c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l205_l217_DUPLICATE_b80c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c6_b4dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_7143_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l188_c11_0272_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_df31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_df31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_d989_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_9856_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_9856_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l199_c11_7e46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ef93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_6914_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_6914_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l211_c11_3cc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l216_c11_898f_return_output;
     VAR_tmp16_uxn_opcodes_h_l177_c3_506b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c11_8a5a_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l209_c3_3b87 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l209_c21_ed7b_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l214_c3_45e9 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l214_c21_14ee_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_1a97_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l205_l217_DUPLICATE_b80c_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l206_c3_11fa_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l205_l217_DUPLICATE_b80c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l186_c24_3535_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l193_l188_l181_l216_l173_l211_l204_l199_DUPLICATE_5f2a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l193_l188_l181_l216_l173_l211_l204_l199_DUPLICATE_5f2a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l193_l188_l181_l216_l173_l211_l204_l199_DUPLICATE_5f2a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_df31_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l193_l188_l181_l216_l173_l211_l204_l199_DUPLICATE_5f2a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_9856_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l193_l188_l181_l216_l173_l211_l204_l199_DUPLICATE_5f2a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l193_l188_l181_l216_l173_l211_l204_l199_DUPLICATE_5f2a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_6914_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l193_l188_l181_l216_l173_l211_l204_l199_DUPLICATE_5f2a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l193_l188_l181_l216_l173_l211_l204_l199_DUPLICATE_5f2a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l216_l188_l173_l181_DUPLICATE_a716_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l216_l188_l173_l181_DUPLICATE_a716_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l216_l188_l173_l181_DUPLICATE_a716_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l216_l188_l173_l181_DUPLICATE_a716_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l193_l188_l181_l216_l211_l204_l199_DUPLICATE_9f76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l193_l188_l181_l216_l211_l204_l199_DUPLICATE_9f76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l193_l188_l181_l216_l211_l204_l199_DUPLICATE_9f76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l193_l188_l181_l216_l211_l204_l199_DUPLICATE_9f76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l193_l188_l181_l216_l211_l204_l199_DUPLICATE_9f76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l193_l188_l181_l216_l211_l204_l199_DUPLICATE_9f76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l193_l188_l181_l216_l211_l204_l199_DUPLICATE_9f76_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l193_l188_l181_l173_l211_l204_l199_DUPLICATE_3cf4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l193_l188_l181_l173_l211_l204_l199_DUPLICATE_3cf4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l193_l188_l181_l173_l211_l204_l199_DUPLICATE_3cf4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l193_l188_l181_l173_l211_l204_l199_DUPLICATE_3cf4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l193_l188_l181_l173_l211_l204_l199_DUPLICATE_3cf4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l193_l188_l181_l173_l211_l204_l199_DUPLICATE_3cf4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l193_l188_l181_l173_l211_l204_l199_DUPLICATE_3cf4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l216_l188_l173_l181_DUPLICATE_a2d1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l216_l188_l173_l181_DUPLICATE_a2d1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l216_l188_l173_l181_DUPLICATE_a2d1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l216_l188_l173_l181_DUPLICATE_a2d1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l188_l181_l173_l211_l199_DUPLICATE_88a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l188_l181_l173_l211_l199_DUPLICATE_88a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l188_l181_l173_l211_l199_DUPLICATE_88a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l188_l181_l173_l211_l199_DUPLICATE_88a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l188_l181_l173_l211_l199_DUPLICATE_88a5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l173_l181_DUPLICATE_a5d3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l173_l181_DUPLICATE_a5d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l173_l193_DUPLICATE_cfce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l173_l193_DUPLICATE_cfce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l188_l173_DUPLICATE_51dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l188_l173_DUPLICATE_51dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l188_l173_DUPLICATE_5170_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l188_l173_DUPLICATE_5170_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l181_c7_f92c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l173_c2_84c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l173_c2_84c3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l209_c3_3b87;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l214_c3_45e9;
     VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue := VAR_tmp16_uxn_opcodes_h_l177_c3_506b;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l191_c24_543f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l191_c24_543f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l191_c34_38eb_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l173_c1_8bf3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l206_c3_11fa] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l206_c3_11fa_x <= VAR_CONST_SL_8_uxn_opcodes_h_l206_c3_11fa_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l206_c3_11fa_return_output := CONST_SL_8_uxn_opcodes_h_l206_c3_11fa_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l217_c3_1a97] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l217_c3_1a97_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_1a97_left;
     BIN_OP_OR_uxn_opcodes_h_l217_c3_1a97_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_1a97_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_1a97_return_output := BIN_OP_OR_uxn_opcodes_h_l217_c3_1a97_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l216_c7_5bca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l181_c7_f92c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l193_c7_df31] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l211_c7_6914] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l216_c7_5bca] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l173_c2_84c3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l216_c7_5bca] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l181_c7_f92c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l216_c7_5bca] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_return_output := result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l188_c7_b6e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l173_c2_84c3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_cf0e_right := VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_1a97_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l217_c3_1a97_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l191_c24_543f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l206_c3_11fa_return_output;
     VAR_printf_uxn_opcodes_h_l174_c3_1690_uxn_opcodes_h_l174_c3_1690_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l173_c1_8bf3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l216_c7_5bca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l216_c7_5bca_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l216_c7_5bca_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l211_c7_6914_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_df31_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l216_c7_5bca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l216_c7_5bca] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_cond;
     tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue;
     tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_return_output := tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_return_output;

     -- printf_uxn_opcodes_h_l174_c3_1690[uxn_opcodes_h_l174_c3_1690] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l174_c3_1690_uxn_opcodes_h_l174_c3_1690_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l174_c3_1690_uxn_opcodes_h_l174_c3_1690_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_ram_addr_MUX[uxn_opcodes_h_l211_c7_6914] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_return_output := result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l221_c15_cf0e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l221_c15_cf0e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_cf0e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l221_c15_cf0e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_cf0e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_cf0e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l221_c15_cf0e_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l211_c7_6914] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l188_c7_b6e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l173_c2_84c3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l211_c7_6914] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l173_c2_84c3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l188_c7_b6e6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output := result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l204_c7_4b0b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l181_c7_f92c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l211_c7_6914] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_0cf0_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_cf0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l211_c7_6914_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l211_c7_6914_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l211_c7_6914_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l211_c7_6914_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_6914_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l216_c7_5bca_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l204_c7_4b0b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l181_c7_f92c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l221_c15_0cf0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l221_c15_0cf0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_0cf0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l221_c15_0cf0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_0cf0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_0cf0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l221_c15_0cf0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l211_c7_6914] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l211_c7_6914_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_6914_cond;
     tmp16_MUX_uxn_opcodes_h_l211_c7_6914_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_6914_iftrue;
     tmp16_MUX_uxn_opcodes_h_l211_c7_6914_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_6914_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_6914_return_output := tmp16_MUX_uxn_opcodes_h_l211_c7_6914_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l204_c7_4b0b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l204_c7_4b0b] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l199_c7_9856] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l204_c7_4b0b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l173_c2_84c3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l181_c7_f92c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_return_output := result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l221_c3_15b5 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l221_c15_0cf0_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l199_c7_9856_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l211_c7_6914_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue := VAR_result_pc_uxn_opcodes_h_l221_c3_15b5;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l199_c7_9856] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l199_c7_9856] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l193_c7_df31] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l216_c7_5bca] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_cond;
     result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_iftrue;
     result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_return_output := result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l199_c7_9856] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l173_c2_84c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l204_c7_4b0b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_cond;
     tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output := tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l173_c2_84c3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_return_output := result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l199_c7_9856] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_return_output := result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l199_c7_9856_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l199_c7_9856_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l199_c7_9856_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l193_c7_df31_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_6914_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l216_c7_5bca_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l199_c7_9856_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_9856_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l193_c7_df31] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_return_output := result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l199_c7_9856] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l199_c7_9856_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_9856_cond;
     tmp16_MUX_uxn_opcodes_h_l199_c7_9856_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_9856_iftrue;
     tmp16_MUX_uxn_opcodes_h_l199_c7_9856_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_9856_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_9856_return_output := tmp16_MUX_uxn_opcodes_h_l199_c7_9856_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l211_c7_6914] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l211_c7_6914_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_6914_cond;
     result_pc_MUX_uxn_opcodes_h_l211_c7_6914_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_6914_iftrue;
     result_pc_MUX_uxn_opcodes_h_l211_c7_6914_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_6914_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_6914_return_output := result_pc_MUX_uxn_opcodes_h_l211_c7_6914_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l193_c7_df31] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l193_c7_df31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l193_c7_df31] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l188_c7_b6e6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_df31_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_df31_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_df31_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l211_c7_6914_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_df31_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_df31_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l199_c7_9856_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l188_c7_b6e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l188_c7_b6e6] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l181_c7_f92c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l188_c7_b6e6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l204_c7_4b0b] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_cond;
     result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_iftrue;
     result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output := result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l188_c7_b6e6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l193_c7_df31] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l193_c7_df31_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_df31_cond;
     tmp16_MUX_uxn_opcodes_h_l193_c7_df31_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_df31_iftrue;
     tmp16_MUX_uxn_opcodes_h_l193_c7_df31_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_df31_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_df31_return_output := tmp16_MUX_uxn_opcodes_h_l193_c7_df31_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_9856_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l204_c7_4b0b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l193_c7_df31_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l181_c7_f92c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l199_c7_9856] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l199_c7_9856_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_9856_cond;
     result_pc_MUX_uxn_opcodes_h_l199_c7_9856_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_9856_iftrue;
     result_pc_MUX_uxn_opcodes_h_l199_c7_9856_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_9856_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_9856_return_output := result_pc_MUX_uxn_opcodes_h_l199_c7_9856_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l173_c2_84c3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l188_c7_b6e6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_cond;
     tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output := tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l181_c7_f92c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l181_c7_f92c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l181_c7_f92c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_df31_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l199_c7_9856_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l193_c7_df31] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l193_c7_df31_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_df31_cond;
     result_pc_MUX_uxn_opcodes_h_l193_c7_df31_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_df31_iftrue;
     result_pc_MUX_uxn_opcodes_h_l193_c7_df31_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_df31_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_df31_return_output := result_pc_MUX_uxn_opcodes_h_l193_c7_df31_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l181_c7_f92c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_cond;
     tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_return_output := tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l173_c2_84c3] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l173_c2_84c3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l173_c2_84c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l173_c2_84c3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_return_output;

     -- Submodule level 9
     VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_df31_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l188_c7_b6e6] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_cond;
     result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_iftrue;
     result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output := result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l173_c2_84c3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_cond;
     tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_return_output := tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_return_output;

     -- Submodule level 10
     VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l188_c7_b6e6_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l173_c2_84c3_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l181_c7_f92c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_cond;
     result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_return_output := result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;

     -- Submodule level 11
     VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l181_c7_f92c_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l173_c2_84c3] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_cond;
     result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_iftrue;
     result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_return_output := result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2f03_uxn_opcodes_h_l169_l228_DUPLICATE_45ec LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2f03_uxn_opcodes_h_l169_l228_DUPLICATE_45ec_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2f03(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l173_c2_84c3_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c2_84c3_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2f03_uxn_opcodes_h_l169_l228_DUPLICATE_45ec_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2f03_uxn_opcodes_h_l169_l228_DUPLICATE_45ec_return_output;
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
