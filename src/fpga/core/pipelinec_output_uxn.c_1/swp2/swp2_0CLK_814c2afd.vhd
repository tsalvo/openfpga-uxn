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
-- Submodules: 67
entity swp2_0CLK_814c2afd is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_814c2afd;
architecture arch of swp2_0CLK_814c2afd is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16_high : unsigned(7 downto 0);
signal REG_COMB_t16_low : unsigned(7 downto 0);
signal REG_COMB_n16_high : unsigned(7 downto 0);
signal REG_COMB_n16_low : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2610_c6_8646]
signal BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2610_c2_c076]
signal t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2610_c2_c076]
signal n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2610_c2_c076]
signal n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2610_c2_c076]
signal t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2610_c2_c076]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2610_c2_c076]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2610_c2_c076]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2610_c2_c076]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2610_c2_c076]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2610_c2_c076]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2610_c2_c076]
signal result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2610_c2_c076]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2610_c2_c076]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2623_c11_c85f]
signal BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2623_c7_fdc8]
signal t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2623_c7_fdc8]
signal n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2623_c7_fdc8]
signal n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2623_c7_fdc8]
signal t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2623_c7_fdc8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2623_c7_fdc8]
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2623_c7_fdc8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2623_c7_fdc8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2623_c7_fdc8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2626_c11_01e9]
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2626_c7_96f9]
signal t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2626_c7_96f9]
signal n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2626_c7_96f9]
signal n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2626_c7_96f9]
signal t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2626_c7_96f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2626_c7_96f9]
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2626_c7_96f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2626_c7_96f9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2626_c7_96f9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2630_c11_420c]
signal BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2630_c7_16ea]
signal t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2630_c7_16ea]
signal n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2630_c7_16ea]
signal n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2630_c7_16ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2630_c7_16ea]
signal result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2630_c7_16ea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2630_c7_16ea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2630_c7_16ea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2634_c11_d53d]
signal BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2634_c7_e85f]
signal n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2634_c7_e85f]
signal n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2634_c7_e85f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2634_c7_e85f]
signal result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2634_c7_e85f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2634_c7_e85f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2634_c7_e85f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2636_c30_a53e]
signal sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2641_c11_dbfa]
signal BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2641_c7_7c1f]
signal n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2641_c7_7c1f]
signal result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2641_c7_7c1f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2641_c7_7c1f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2641_c7_7c1f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2647_c11_f218]
signal BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2647_c7_79d8]
signal result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2647_c7_79d8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2647_c7_79d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2651_c11_94bf]
signal BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2651_c7_827c]
signal result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2651_c7_827c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2651_c7_827c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_84a2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646
BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_left,
BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_right,
BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2610_c2_c076
t16_low_MUX_uxn_opcodes_h_l2610_c2_c076 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_cond,
t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue,
t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse,
t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2610_c2_c076
n16_low_MUX_uxn_opcodes_h_l2610_c2_c076 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_cond,
n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue,
n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse,
n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2610_c2_c076
n16_high_MUX_uxn_opcodes_h_l2610_c2_c076 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_cond,
n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue,
n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse,
n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2610_c2_c076
t16_high_MUX_uxn_opcodes_h_l2610_c2_c076 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_cond,
t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue,
t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse,
t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076
result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076
result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076
result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_cond,
result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076
result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_left,
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_right,
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8
t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond,
t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue,
t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse,
t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8
n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond,
n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue,
n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse,
n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8
n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond,
n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue,
n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse,
n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8
t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond,
t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue,
t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse,
t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8
result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_left,
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_right,
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9
t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_cond,
t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue,
t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse,
t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9
n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_cond,
n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue,
n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse,
n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9
n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_cond,
n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue,
n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse,
n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9
t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_cond,
t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue,
t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse,
t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9
result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c
BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_left,
BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_right,
BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea
t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_cond,
t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue,
t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse,
t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea
n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_cond,
n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue,
n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse,
n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea
n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_cond,
n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue,
n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse,
n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea
result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea
result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_cond,
result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea
result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea
result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d
BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_left,
BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_right,
BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f
n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_cond,
n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue,
n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse,
n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f
n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_cond,
n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue,
n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse,
n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f
result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f
result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f
result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e
sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_ins,
sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_x,
sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_y,
sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa
BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_left,
BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_right,
BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f
n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond,
n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue,
n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse,
n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f
result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218
BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218_left,
BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218_right,
BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8
result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8
result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf
BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf_left,
BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf_right,
BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c
result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c
result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16_high,
 t16_low,
 n16_high,
 n16_low,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_return_output,
 t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_return_output,
 n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_return_output,
 n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_return_output,
 t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_return_output,
 t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output,
 n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output,
 n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output,
 t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_return_output,
 t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output,
 n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output,
 n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output,
 t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_return_output,
 t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output,
 n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output,
 n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_return_output,
 n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output,
 n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output,
 sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_return_output,
 n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2615_c3_20d8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2620_c3_6595 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2624_c3_faf7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2628_c3_c20d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2632_c3_4aff : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2638_c3_91d9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2643_c3_4fe3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2644_c3_e12c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2648_c3_71da : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2652_c3_7be2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2651_c7_827c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2630_l2626_l2623_l2651_l2610_DUPLICATE_97df_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2630_l2626_l2623_l2651_l2647_l2641_l2634_DUPLICATE_dd20_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2630_l2623_l2626_l2641_DUPLICATE_6e83_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2630_l2623_l2634_l2626_DUPLICATE_3d50_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2657_l2606_DUPLICATE_c36d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16_high : unsigned(7 downto 0);
variable REG_VAR_t16_low : unsigned(7 downto 0);
variable REG_VAR_n16_high : unsigned(7 downto 0);
variable REG_VAR_n16_low : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16_high := t16_high;
  REG_VAR_t16_low := t16_low;
  REG_VAR_n16_high := n16_high;
  REG_VAR_n16_low := n16_low;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2624_c3_faf7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2624_c3_faf7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2632_c3_4aff := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2632_c3_4aff;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2615_c3_20d8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2615_c3_20d8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218_right := to_unsigned(6, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2648_c3_71da := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2648_c3_71da;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2652_c3_7be2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2652_c3_7be2;
     VAR_sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2620_c3_6595 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2620_c3_6595;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2628_c3_c20d := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2628_c3_c20d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2643_c3_4fe3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2643_c3_4fe3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2638_c3_91d9 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2638_c3_91d9;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2644_c3_e12c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2644_c3_e12c;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse := t16_low;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2630_l2623_l2634_l2626_DUPLICATE_3d50 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2630_l2623_l2634_l2626_DUPLICATE_3d50_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2647_c11_f218] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218_left;
     BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218_return_output := BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2610_c2_c076] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2610_c2_c076_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2630_l2626_l2623_l2651_l2610_DUPLICATE_97df LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2630_l2626_l2623_l2651_l2610_DUPLICATE_97df_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2623_c11_c85f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2641_c11_dbfa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2610_c2_c076] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2610_c2_c076_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2626_c11_01e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2636_c30_a53e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_ins;
     sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_x;
     sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_return_output := sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2630_l2626_l2623_l2651_l2647_l2641_l2634_DUPLICATE_dd20 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2630_l2626_l2623_l2651_l2647_l2641_l2634_DUPLICATE_dd20_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2651_c11_94bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2610_c2_c076] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2610_c2_c076_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2610_c6_8646] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_left;
     BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_return_output := BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2634_c11_d53d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2630_l2623_l2626_l2641_DUPLICATE_6e83 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2630_l2623_l2626_l2641_DUPLICATE_6e83_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2610_c2_c076] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2610_c2_c076_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2630_c11_420c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2651_c7_827c] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2651_c7_827c_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c6_8646_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_c85f_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_01e9_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_420c_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_d53d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_dbfa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c11_f218_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2651_c11_94bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2630_l2623_l2626_l2641_DUPLICATE_6e83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2630_l2623_l2626_l2641_DUPLICATE_6e83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2630_l2623_l2626_l2641_DUPLICATE_6e83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2630_l2623_l2626_l2641_DUPLICATE_6e83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2630_l2626_l2623_l2651_l2647_l2641_l2634_DUPLICATE_dd20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2630_l2626_l2623_l2651_l2647_l2641_l2634_DUPLICATE_dd20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2630_l2626_l2623_l2651_l2647_l2641_l2634_DUPLICATE_dd20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2630_l2626_l2623_l2651_l2647_l2641_l2634_DUPLICATE_dd20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2630_l2626_l2623_l2651_l2647_l2641_l2634_DUPLICATE_dd20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2630_l2626_l2623_l2651_l2647_l2641_l2634_DUPLICATE_dd20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2630_l2626_l2623_l2651_l2647_l2641_l2634_DUPLICATE_dd20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2630_l2623_l2634_l2626_DUPLICATE_3d50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2630_l2623_l2634_l2626_DUPLICATE_3d50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2630_l2623_l2634_l2626_DUPLICATE_3d50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2630_l2623_l2634_l2626_DUPLICATE_3d50_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2630_l2626_l2623_l2651_l2610_DUPLICATE_97df_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2630_l2626_l2623_l2651_l2610_DUPLICATE_97df_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2630_l2626_l2623_l2651_l2610_DUPLICATE_97df_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2630_l2626_l2623_l2651_l2610_DUPLICATE_97df_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2630_l2626_l2623_l2651_l2610_DUPLICATE_97df_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2610_c2_c076_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2610_c2_c076_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2610_c2_c076_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2610_c2_c076_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2651_c7_827c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2636_c30_a53e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2641_c7_7c1f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2630_c7_16ea] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_cond;
     t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output := t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2651_c7_827c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2610_c2_c076] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2610_c2_c076] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2651_c7_827c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2610_c2_c076] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2634_c7_e85f] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_cond;
     n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output := n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2651_c7_827c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2610_c2_c076] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2626_c7_96f9] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_cond;
     t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output := t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2641_c7_7c1f] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond;
     n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output := n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2634_c7_e85f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2651_c7_827c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2651_c7_827c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2651_c7_827c_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2634_c7_e85f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2634_c7_e85f] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_cond;
     n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output := n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2647_c7_79d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2647_c7_79d8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2630_c7_16ea] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_cond;
     n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output := n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2630_c7_16ea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2626_c7_96f9] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_cond;
     t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output := t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2623_c7_fdc8] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond;
     t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output := t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2647_c7_79d8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c7_79d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c7_79d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2647_c7_79d8_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output;
     -- t16_high_MUX[uxn_opcodes_h_l2610_c2_c076] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_cond;
     t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_return_output := t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2641_c7_7c1f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2641_c7_7c1f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2641_c7_7c1f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2630_c7_16ea] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_cond;
     n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output := n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2630_c7_16ea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2623_c7_fdc8] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond;
     t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output := t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2626_c7_96f9] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_cond;
     n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output := n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2626_c7_96f9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c7_7c1f_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2610_c2_c076_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2626_c7_96f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2634_c7_e85f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2626_c7_96f9] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_cond;
     n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output := n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2634_c7_e85f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2610_c2_c076] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_cond;
     t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_return_output := t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2623_c7_fdc8] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond;
     n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output := n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2623_c7_fdc8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2634_c7_e85f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_e85f_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2610_c2_c076_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2630_c7_16ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2610_c2_c076] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2610_c2_c076] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_cond;
     n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_return_output := n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2630_c7_16ea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output := result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2623_c7_fdc8] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond;
     n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output := n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2623_c7_fdc8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2630_c7_16ea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2610_c2_c076_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2630_c7_16ea_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2610_c2_c076] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2626_c7_96f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2626_c7_96f9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2610_c2_c076] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_cond;
     n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_return_output := n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2626_c7_96f9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2610_c2_c076_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_96f9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2623_c7_fdc8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2623_c7_fdc8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2623_c7_fdc8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_fdc8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2610_c2_c076] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2610_c2_c076] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2610_c2_c076] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_return_output := result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2657_l2606_DUPLICATE_c36d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2657_l2606_DUPLICATE_c36d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_84a2(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c2_c076_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2610_c2_c076_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2610_c2_c076_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c2_c076_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c2_c076_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2610_c2_c076_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c2_c076_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c2_c076_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2610_c2_c076_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2657_l2606_DUPLICATE_c36d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2657_l2606_DUPLICATE_c36d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16_high <= REG_VAR_t16_high;
REG_COMB_t16_low <= REG_VAR_t16_low;
REG_COMB_n16_high <= REG_VAR_n16_high;
REG_COMB_n16_low <= REG_VAR_n16_low;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16_high <= REG_COMB_t16_high;
     t16_low <= REG_COMB_t16_low;
     n16_high <= REG_COMB_n16_high;
     n16_low <= REG_COMB_n16_low;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
