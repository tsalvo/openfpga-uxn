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
-- Submodules: 71
entity add2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_50b92fe2;
architecture arch of add2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l853_c6_03ba]
signal BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l853_c2_08cb]
signal t16_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l853_c2_08cb]
signal tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l853_c2_08cb]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l853_c2_08cb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l853_c2_08cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l853_c2_08cb]
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l853_c2_08cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l853_c2_08cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l853_c2_08cb]
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l853_c2_08cb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l853_c2_08cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l853_c2_08cb]
signal n16_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l866_c11_f842]
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l866_c7_ad8f]
signal t16_MUX_uxn_opcodes_h_l866_c7_ad8f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l866_c7_ad8f]
signal tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l866_c7_ad8f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l866_c7_ad8f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l866_c7_ad8f]
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l866_c7_ad8f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l866_c7_ad8f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l866_c7_ad8f]
signal n16_MUX_uxn_opcodes_h_l866_c7_ad8f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l869_c11_53d9]
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l869_c7_081d]
signal t16_MUX_uxn_opcodes_h_l869_c7_081d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_081d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_081d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_081d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l869_c7_081d]
signal tmp16_MUX_uxn_opcodes_h_l869_c7_081d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l869_c7_081d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l869_c7_081d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l869_c7_081d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l869_c7_081d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l869_c7_081d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l869_c7_081d]
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l869_c7_081d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l869_c7_081d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l869_c7_081d]
signal n16_MUX_uxn_opcodes_h_l869_c7_081d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l869_c7_081d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l869_c7_081d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l869_c7_081d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l874_c11_4ba4]
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l874_c7_9d78]
signal t16_MUX_uxn_opcodes_h_l874_c7_9d78_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l874_c7_9d78_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l874_c7_9d78]
signal tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l874_c7_9d78]
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l874_c7_9d78]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l874_c7_9d78]
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l874_c7_9d78]
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l874_c7_9d78]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l874_c7_9d78]
signal n16_MUX_uxn_opcodes_h_l874_c7_9d78_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l874_c7_9d78_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l875_c3_2da0]
signal BIN_OP_OR_uxn_opcodes_h_l875_c3_2da0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l875_c3_2da0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l875_c3_2da0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l878_c11_0486]
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l878_c7_adf7]
signal tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l878_c7_adf7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l878_c7_adf7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l878_c7_adf7]
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l878_c7_adf7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l878_c7_adf7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l878_c7_adf7]
signal n16_MUX_uxn_opcodes_h_l878_c7_adf7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c7_adf7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l882_c11_4636]
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l882_c7_cd1e]
signal tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l882_c7_cd1e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l882_c7_cd1e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l882_c7_cd1e]
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l882_c7_cd1e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l882_c7_cd1e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l882_c7_cd1e]
signal n16_MUX_uxn_opcodes_h_l882_c7_cd1e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l883_c3_1267]
signal BIN_OP_OR_uxn_opcodes_h_l883_c3_1267_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l883_c3_1267_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l883_c3_1267_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l884_c11_3b1c]
signal BIN_OP_PLUS_uxn_opcodes_h_l884_c11_3b1c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l884_c11_3b1c_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l884_c11_3b1c_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l885_c30_7b7a]
signal sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l890_c11_cbb0]
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l890_c7_c671]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l890_c7_c671]
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l890_c7_c671]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l890_c7_c671]
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l893_c31_8cdd]
signal CONST_SR_8_uxn_opcodes_h_l893_c31_8cdd_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l893_c31_8cdd_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_ca10
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_ca10_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_ca10_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_71f0( ref_toks_0 : opcode_result_t;
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
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba
BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_left,
BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_right,
BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_return_output);

-- t16_MUX_uxn_opcodes_h_l853_c2_08cb
t16_MUX_uxn_opcodes_h_l853_c2_08cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l853_c2_08cb_cond,
t16_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue,
t16_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse,
t16_MUX_uxn_opcodes_h_l853_c2_08cb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l853_c2_08cb
tmp16_MUX_uxn_opcodes_h_l853_c2_08cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_cond,
tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue,
tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse,
tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb
result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_cond,
result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_return_output);

-- n16_MUX_uxn_opcodes_h_l853_c2_08cb
n16_MUX_uxn_opcodes_h_l853_c2_08cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l853_c2_08cb_cond,
n16_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue,
n16_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse,
n16_MUX_uxn_opcodes_h_l853_c2_08cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842
BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_left,
BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_right,
BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_return_output);

-- t16_MUX_uxn_opcodes_h_l866_c7_ad8f
t16_MUX_uxn_opcodes_h_l866_c7_ad8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l866_c7_ad8f_cond,
t16_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue,
t16_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse,
t16_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f
tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_cond,
tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue,
tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse,
tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f
result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_cond,
result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output);

-- n16_MUX_uxn_opcodes_h_l866_c7_ad8f
n16_MUX_uxn_opcodes_h_l866_c7_ad8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l866_c7_ad8f_cond,
n16_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue,
n16_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse,
n16_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9
BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_left,
BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_right,
BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_return_output);

-- t16_MUX_uxn_opcodes_h_l869_c7_081d
t16_MUX_uxn_opcodes_h_l869_c7_081d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l869_c7_081d_cond,
t16_MUX_uxn_opcodes_h_l869_c7_081d_iftrue,
t16_MUX_uxn_opcodes_h_l869_c7_081d_iffalse,
t16_MUX_uxn_opcodes_h_l869_c7_081d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l869_c7_081d
tmp16_MUX_uxn_opcodes_h_l869_c7_081d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l869_c7_081d_cond,
tmp16_MUX_uxn_opcodes_h_l869_c7_081d_iftrue,
tmp16_MUX_uxn_opcodes_h_l869_c7_081d_iffalse,
tmp16_MUX_uxn_opcodes_h_l869_c7_081d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d
result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_cond,
result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_return_output);

-- n16_MUX_uxn_opcodes_h_l869_c7_081d
n16_MUX_uxn_opcodes_h_l869_c7_081d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l869_c7_081d_cond,
n16_MUX_uxn_opcodes_h_l869_c7_081d_iftrue,
n16_MUX_uxn_opcodes_h_l869_c7_081d_iffalse,
n16_MUX_uxn_opcodes_h_l869_c7_081d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4
BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_left,
BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_right,
BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_return_output);

-- t16_MUX_uxn_opcodes_h_l874_c7_9d78
t16_MUX_uxn_opcodes_h_l874_c7_9d78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l874_c7_9d78_cond,
t16_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue,
t16_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse,
t16_MUX_uxn_opcodes_h_l874_c7_9d78_return_output);

-- tmp16_MUX_uxn_opcodes_h_l874_c7_9d78
tmp16_MUX_uxn_opcodes_h_l874_c7_9d78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_cond,
tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue,
tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse,
tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78
result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_cond,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_return_output);

-- n16_MUX_uxn_opcodes_h_l874_c7_9d78
n16_MUX_uxn_opcodes_h_l874_c7_9d78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l874_c7_9d78_cond,
n16_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue,
n16_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse,
n16_MUX_uxn_opcodes_h_l874_c7_9d78_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l875_c3_2da0
BIN_OP_OR_uxn_opcodes_h_l875_c3_2da0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l875_c3_2da0_left,
BIN_OP_OR_uxn_opcodes_h_l875_c3_2da0_right,
BIN_OP_OR_uxn_opcodes_h_l875_c3_2da0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486
BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_left,
BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_right,
BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_return_output);

-- tmp16_MUX_uxn_opcodes_h_l878_c7_adf7
tmp16_MUX_uxn_opcodes_h_l878_c7_adf7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_cond,
tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue,
tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse,
tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7
result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_cond,
result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_return_output);

-- n16_MUX_uxn_opcodes_h_l878_c7_adf7
n16_MUX_uxn_opcodes_h_l878_c7_adf7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l878_c7_adf7_cond,
n16_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue,
n16_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse,
n16_MUX_uxn_opcodes_h_l878_c7_adf7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636
BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_left,
BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_right,
BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_return_output);

-- tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e
tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_cond,
tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue,
tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse,
tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e
result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_cond,
result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output);

-- n16_MUX_uxn_opcodes_h_l882_c7_cd1e
n16_MUX_uxn_opcodes_h_l882_c7_cd1e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l882_c7_cd1e_cond,
n16_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue,
n16_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse,
n16_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l883_c3_1267
BIN_OP_OR_uxn_opcodes_h_l883_c3_1267 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l883_c3_1267_left,
BIN_OP_OR_uxn_opcodes_h_l883_c3_1267_right,
BIN_OP_OR_uxn_opcodes_h_l883_c3_1267_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l884_c11_3b1c
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_3b1c : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_3b1c_left,
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_3b1c_right,
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_3b1c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a
sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_ins,
sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_x,
sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_y,
sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0
BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0_left,
BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0_right,
BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671
result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_cond,
result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_return_output);

-- CONST_SR_8_uxn_opcodes_h_l893_c31_8cdd
CONST_SR_8_uxn_opcodes_h_l893_c31_8cdd : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l893_c31_8cdd_x,
CONST_SR_8_uxn_opcodes_h_l893_c31_8cdd_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_ca10
CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_ca10 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_ca10_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_ca10_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_return_output,
 t16_MUX_uxn_opcodes_h_l853_c2_08cb_return_output,
 tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_return_output,
 n16_MUX_uxn_opcodes_h_l853_c2_08cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_return_output,
 t16_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output,
 tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output,
 n16_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_return_output,
 t16_MUX_uxn_opcodes_h_l869_c7_081d_return_output,
 tmp16_MUX_uxn_opcodes_h_l869_c7_081d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_return_output,
 n16_MUX_uxn_opcodes_h_l869_c7_081d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_return_output,
 t16_MUX_uxn_opcodes_h_l874_c7_9d78_return_output,
 tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_return_output,
 n16_MUX_uxn_opcodes_h_l874_c7_9d78_return_output,
 BIN_OP_OR_uxn_opcodes_h_l875_c3_2da0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_return_output,
 tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_return_output,
 n16_MUX_uxn_opcodes_h_l878_c7_adf7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_return_output,
 tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output,
 n16_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l883_c3_1267_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l884_c11_3b1c_return_output,
 sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_return_output,
 CONST_SR_8_uxn_opcodes_h_l893_c31_8cdd_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_ca10_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l858_c3_79ba : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_c576 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_08cb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_08cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_081d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_ad8f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_081d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_73d9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_081d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_ad8f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_081d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_081d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_9d78_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_081d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_081d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_081d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_081d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l872_c3_f86b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_081d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_081d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_9d78_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_081d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_9d78_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_49ed : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_adf7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_9d78_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_2da0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_2da0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_2da0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_adf7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l884_c3_5277 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l887_c3_e280 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_cd1e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_1267_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_1267_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_1267_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_3b1c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_3b1c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_3b1c_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l888_c21_c754_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_5dc2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l891_c3_4350 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_8cdd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_8cdd_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l893_c21_4421_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l874_l869_l866_l890_l853_l878_DUPLICATE_236c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l874_l869_l866_l882_l878_DUPLICATE_2583_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l874_l869_l866_l890_l878_DUPLICATE_4189_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l874_l869_l866_l890_l882_l878_DUPLICATE_427d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l870_l879_l883_l875_DUPLICATE_140f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_ca10_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_ca10_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_d434_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l849_l897_DUPLICATE_0242_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_73d9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_73d9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l887_c3_e280 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l887_c3_e280;
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l858_c3_79ba := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l858_c3_79ba;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_5dc2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_5dc2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l872_c3_f86b := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l872_c3_f86b;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_49ed := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_49ed;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_c576 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_c576;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l891_c3_4350 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l891_c3_4350;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_1267_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_081d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_2da0_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_3b1c_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_8cdd_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_081d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse := tmp16;
     -- sp_relative_shift[uxn_opcodes_h_l885_c30_7b7a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_ins;
     sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_x;
     sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_return_output := sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l869_c11_53d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l893_c31_8cdd] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l893_c31_8cdd_x <= VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_8cdd_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_8cdd_return_output := CONST_SR_8_uxn_opcodes_h_l893_c31_8cdd_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l853_c2_08cb] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l853_c2_08cb_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l853_c2_08cb] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l853_c2_08cb_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l890_c11_cbb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l882_c11_4636] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_left;
     BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_return_output := BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l878_c11_0486] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_left;
     BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_return_output := BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l866_c11_f842] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_left;
     BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_return_output := BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l874_l869_l866_l890_l882_l878_DUPLICATE_427d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l874_l869_l866_l890_l882_l878_DUPLICATE_427d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l853_c6_03ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l870_l879_l883_l875_DUPLICATE_140f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l870_l879_l883_l875_DUPLICATE_140f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l853_c2_08cb] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l853_c2_08cb_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_d434 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_d434_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l853_c2_08cb] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l853_c2_08cb_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l874_l869_l866_l882_l878_DUPLICATE_2583 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l874_l869_l866_l882_l878_DUPLICATE_2583_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l874_l869_l866_l890_l878_DUPLICATE_4189 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l874_l869_l866_l890_l878_DUPLICATE_4189_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l874_c11_4ba4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_left;
     BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_return_output := BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l874_l869_l866_l890_l853_l878_DUPLICATE_236c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l874_l869_l866_l890_l853_l878_DUPLICATE_236c_return_output := result.u8_value;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_08cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_08cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_03ba_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_ad8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_ad8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f842_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_081d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_081d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_081d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_53d9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_9d78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_9d78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_4ba4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_adf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0486_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_cd1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_4636_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_cbb0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_2da0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l870_l879_l883_l875_DUPLICATE_140f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_1267_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l870_l879_l883_l875_DUPLICATE_140f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_ca10_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l870_l879_l883_l875_DUPLICATE_140f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l874_l869_l866_l890_l878_DUPLICATE_4189_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l874_l869_l866_l890_l878_DUPLICATE_4189_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l874_l869_l866_l890_l878_DUPLICATE_4189_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l874_l869_l866_l890_l878_DUPLICATE_4189_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l874_l869_l866_l890_l878_DUPLICATE_4189_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l874_l869_l866_l890_l882_l878_DUPLICATE_427d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l874_l869_l866_l890_l882_l878_DUPLICATE_427d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l874_l869_l866_l890_l882_l878_DUPLICATE_427d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l874_l869_l866_l890_l882_l878_DUPLICATE_427d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l874_l869_l866_l890_l882_l878_DUPLICATE_427d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l874_l869_l866_l890_l882_l878_DUPLICATE_427d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l874_l869_l866_l882_l878_DUPLICATE_2583_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l874_l869_l866_l882_l878_DUPLICATE_2583_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l874_l869_l866_l882_l878_DUPLICATE_2583_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l874_l869_l866_l882_l878_DUPLICATE_2583_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l874_l869_l866_l882_l878_DUPLICATE_2583_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_d434_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_d434_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l874_l869_l866_l890_l853_l878_DUPLICATE_236c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l874_l869_l866_l890_l853_l878_DUPLICATE_236c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l874_l869_l866_l890_l853_l878_DUPLICATE_236c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l874_l869_l866_l890_l853_l878_DUPLICATE_236c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l874_l869_l866_l890_l853_l878_DUPLICATE_236c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l874_l869_l866_l890_l853_l878_DUPLICATE_236c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l853_c2_08cb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l853_c2_08cb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l853_c2_08cb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l853_c2_08cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_7b7a_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l883_c3_1267] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l883_c3_1267_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_1267_left;
     BIN_OP_OR_uxn_opcodes_h_l883_c3_1267_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_1267_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_1267_return_output := BIN_OP_OR_uxn_opcodes_h_l883_c3_1267_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l890_c7_c671] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l853_c2_08cb] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l893_c21_4421] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l893_c21_4421_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_8cdd_return_output);

     -- result_is_ram_write_MUX[uxn_opcodes_h_l853_c2_08cb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l890_c7_c671] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l853_c2_08cb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l882_c7_cd1e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_ca10 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_ca10_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_ca10_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_ca10_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_ca10_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l853_c2_08cb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l875_c3_2da0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l875_c3_2da0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_2da0_left;
     BIN_OP_OR_uxn_opcodes_h_l875_c3_2da0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_2da0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_2da0_return_output := BIN_OP_OR_uxn_opcodes_h_l875_c3_2da0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l890_c7_c671] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_2da0_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_3b1c_right := VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_1267_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_1267_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l893_c21_4421_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_ca10_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_081d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_ca10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_c671_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_c671_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_c671_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l878_c7_adf7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_return_output;

     -- t16_MUX[uxn_opcodes_h_l874_c7_9d78] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l874_c7_9d78_cond <= VAR_t16_MUX_uxn_opcodes_h_l874_c7_9d78_cond;
     t16_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue;
     t16_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_9d78_return_output := t16_MUX_uxn_opcodes_h_l874_c7_9d78_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l882_c7_cd1e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output;

     -- n16_MUX[uxn_opcodes_h_l882_c7_cd1e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l882_c7_cd1e_cond <= VAR_n16_MUX_uxn_opcodes_h_l882_c7_cd1e_cond;
     n16_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue;
     n16_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output := n16_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l884_c11_3b1c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l884_c11_3b1c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_3b1c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l884_c11_3b1c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_3b1c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_3b1c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l884_c11_3b1c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l882_c7_cd1e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l890_c7_c671] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_cond;
     result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_return_output := result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l882_c7_cd1e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l884_c3_5277 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_3b1c_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_adf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_c671_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_081d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l874_c7_9d78_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue := VAR_tmp16_uxn_opcodes_h_l884_c3_5277;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l878_c7_adf7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l878_c7_adf7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_return_output;

     -- n16_MUX[uxn_opcodes_h_l878_c7_adf7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l878_c7_adf7_cond <= VAR_n16_MUX_uxn_opcodes_h_l878_c7_adf7_cond;
     n16_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue;
     n16_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_adf7_return_output := n16_MUX_uxn_opcodes_h_l878_c7_adf7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l882_c7_cd1e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_cond;
     tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output := tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l874_c7_9d78] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l888_c21_c754] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l888_c21_c754_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l884_c3_5277);

     -- t16_MUX[uxn_opcodes_h_l869_c7_081d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l869_c7_081d_cond <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_081d_cond;
     t16_MUX_uxn_opcodes_h_l869_c7_081d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_081d_iftrue;
     t16_MUX_uxn_opcodes_h_l869_c7_081d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_081d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_081d_return_output := t16_MUX_uxn_opcodes_h_l869_c7_081d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l878_c7_adf7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l888_c21_c754_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse := VAR_n16_MUX_uxn_opcodes_h_l878_c7_adf7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_adf7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_9d78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_adf7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_adf7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l869_c7_081d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l869_c7_081d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_return_output;

     -- t16_MUX[uxn_opcodes_h_l866_c7_ad8f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l866_c7_ad8f_cond <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_ad8f_cond;
     t16_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue;
     t16_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output := t16_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output;

     -- n16_MUX[uxn_opcodes_h_l874_c7_9d78] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l874_c7_9d78_cond <= VAR_n16_MUX_uxn_opcodes_h_l874_c7_9d78_cond;
     n16_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue;
     n16_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_9d78_return_output := n16_MUX_uxn_opcodes_h_l874_c7_9d78_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l874_c7_9d78] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l878_c7_adf7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_cond;
     tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_return_output := tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l874_c7_9d78] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l874_c7_9d78] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l882_c7_cd1e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output := result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_081d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l874_c7_9d78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_9d78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_081d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_9d78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_9d78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cd1e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_adf7_return_output;
     -- t16_MUX[uxn_opcodes_h_l853_c2_08cb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l853_c2_08cb_cond <= VAR_t16_MUX_uxn_opcodes_h_l853_c2_08cb_cond;
     t16_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue;
     t16_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_08cb_return_output := t16_MUX_uxn_opcodes_h_l853_c2_08cb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l878_c7_adf7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_return_output := result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l869_c7_081d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l866_c7_ad8f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l869_c7_081d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l869_c7_081d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l874_c7_9d78] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_cond;
     tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue;
     tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_return_output := tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_return_output;

     -- n16_MUX[uxn_opcodes_h_l869_c7_081d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l869_c7_081d_cond <= VAR_n16_MUX_uxn_opcodes_h_l869_c7_081d_cond;
     n16_MUX_uxn_opcodes_h_l869_c7_081d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l869_c7_081d_iftrue;
     n16_MUX_uxn_opcodes_h_l869_c7_081d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l869_c7_081d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_081d_return_output := n16_MUX_uxn_opcodes_h_l869_c7_081d_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l869_c7_081d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_081d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_081d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_081d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_adf7_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l853_c2_08cb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_081d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_9d78_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l874_c7_9d78] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_cond;
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_return_output := result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l866_c7_ad8f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l869_c7_081d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l869_c7_081d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_081d_cond;
     tmp16_MUX_uxn_opcodes_h_l869_c7_081d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_081d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l869_c7_081d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_081d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_081d_return_output := tmp16_MUX_uxn_opcodes_h_l869_c7_081d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l853_c2_08cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_return_output;

     -- n16_MUX[uxn_opcodes_h_l866_c7_ad8f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l866_c7_ad8f_cond <= VAR_n16_MUX_uxn_opcodes_h_l866_c7_ad8f_cond;
     n16_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue;
     n16_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output := n16_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l866_c7_ad8f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l866_c7_ad8f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_9d78_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_081d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l853_c2_08cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l853_c2_08cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l853_c2_08cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_return_output;

     -- n16_MUX[uxn_opcodes_h_l853_c2_08cb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l853_c2_08cb_cond <= VAR_n16_MUX_uxn_opcodes_h_l853_c2_08cb_cond;
     n16_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue;
     n16_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_08cb_return_output := n16_MUX_uxn_opcodes_h_l853_c2_08cb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l866_c7_ad8f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_cond;
     tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output := tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l869_c7_081d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_return_output := result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l853_c2_08cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_081d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l853_c2_08cb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_cond;
     tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_return_output := tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l866_c7_ad8f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output := result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ad8f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_08cb_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l853_c2_08cb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_return_output := result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l849_l897_DUPLICATE_0242 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l849_l897_DUPLICATE_0242_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_71f0(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_08cb_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_08cb_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_08cb_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_08cb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_08cb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_08cb_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_08cb_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_08cb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_08cb_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l849_l897_DUPLICATE_0242_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l849_l897_DUPLICATE_0242_return_output;
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
