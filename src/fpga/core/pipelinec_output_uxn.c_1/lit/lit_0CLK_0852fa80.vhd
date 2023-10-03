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
-- Submodules: 73
entity lit_0CLK_0852fa80 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit_0CLK_0852fa80;
architecture arch of lit_0CLK_0852fa80 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal lit_tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_lit_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l236_c6_66b6]
signal BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l236_c1_ccf3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l236_c2_f2fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l236_c2_f2fa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l236_c2_f2fa]
signal result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l236_c2_f2fa]
signal result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l236_c2_f2fa]
signal result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l236_c2_f2fa]
signal result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l236_c2_f2fa]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l236_c2_f2fa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : signed(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l236_c2_f2fa]
signal result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l236_c2_f2fa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l236_c2_f2fa]
signal result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l236_c2_f2fa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l236_c2_f2fa]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(0 downto 0);

-- lit_tmp8_MUX[uxn_opcodes_h_l236_c2_f2fa]
signal lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l237_c3_6f4c[uxn_opcodes_h_l237_c3_6f4c]
signal printf_uxn_opcodes_h_l237_c3_6f4c_uxn_opcodes_h_l237_c3_6f4c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l243_c11_9486]
signal BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l243_c7_8f41]
signal result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l243_c7_8f41]
signal result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l243_c7_8f41]
signal result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l243_c7_8f41]
signal result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l243_c7_8f41]
signal result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l243_c7_8f41]
signal result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l243_c7_8f41]
signal result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l243_c7_8f41]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l243_c7_8f41]
signal result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l243_c7_8f41]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l243_c7_8f41]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(0 downto 0);

-- lit_tmp8_MUX[uxn_opcodes_h_l243_c7_8f41]
signal lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l249_c11_0054]
signal BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l249_c7_ce60]
signal result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l249_c7_ce60]
signal result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l249_c7_ce60]
signal result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l249_c7_ce60]
signal result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l249_c7_ce60]
signal result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l249_c7_ce60]
signal result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l249_c7_ce60]
signal result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l249_c7_ce60]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l249_c7_ce60]
signal result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l249_c7_ce60]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_return_output : unsigned(0 downto 0);

-- lit_tmp8_MUX[uxn_opcodes_h_l249_c7_ce60]
signal lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_cond : unsigned(0 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l254_c11_2674]
signal BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l254_c7_e78c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l254_c7_e78c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l254_c7_e78c]
signal result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l254_c7_e78c]
signal result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l254_c7_e78c]
signal result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l254_c7_e78c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l254_c7_e78c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l254_c7_e78c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l254_c7_e78c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_return_output : unsigned(0 downto 0);

-- lit_tmp8_MUX[uxn_opcodes_h_l254_c7_e78c]
signal lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_cond : unsigned(0 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l257_c15_391c]
signal BIN_OP_PLUS_uxn_opcodes_h_l257_c15_391c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l257_c15_391c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l257_c15_391c_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l260_c11_ec86]
signal BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l260_c7_367e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l260_c7_367e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l260_c7_367e]
signal result_pc_MUX_uxn_opcodes_h_l260_c7_367e_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l260_c7_367e_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l260_c7_367e_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l260_c7_367e_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l260_c7_367e]
signal result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l260_c7_367e]
signal result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l260_c7_367e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l260_c7_367e]
signal result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l260_c7_367e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l260_c7_367e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l266_c11_a82c]
signal BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l266_c7_c728]
signal result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l266_c7_c728]
signal result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l266_c7_c728]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l266_c7_c728]
signal result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l266_c7_c728]
signal result_pc_MUX_uxn_opcodes_h_l266_c7_c728_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l266_c7_c728_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l266_c7_c728_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l266_c7_c728_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l266_c7_c728]
signal result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l266_c7_c728]
signal result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6
BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_left,
BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_right,
BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa
result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa
result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output);

-- result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa
result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_cond,
result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue,
result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse,
result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa
result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_cond,
result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa
result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa
result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_cond,
result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa
result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa
result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa
result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa
result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa
result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output);

-- lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa
lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_cond,
lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue,
lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse,
lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output);

-- printf_uxn_opcodes_h_l237_c3_6f4c_uxn_opcodes_h_l237_c3_6f4c
printf_uxn_opcodes_h_l237_c3_6f4c_uxn_opcodes_h_l237_c3_6f4c : entity work.printf_uxn_opcodes_h_l237_c3_6f4c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l237_c3_6f4c_uxn_opcodes_h_l237_c3_6f4c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486
BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_left,
BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_right,
BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41
result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41
result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_return_output);

-- result_pc_MUX_uxn_opcodes_h_l243_c7_8f41
result_pc_MUX_uxn_opcodes_h_l243_c7_8f41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_cond,
result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue,
result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse,
result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41
result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_cond,
result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41
result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_cond,
result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41
result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41
result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41
result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41
result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41
result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_return_output);

-- lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41
lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_cond,
lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue,
lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse,
lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054
BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_left,
BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_right,
BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60
result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60
result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_return_output);

-- result_pc_MUX_uxn_opcodes_h_l249_c7_ce60
result_pc_MUX_uxn_opcodes_h_l249_c7_ce60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_cond,
result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue,
result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse,
result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60
result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_cond,
result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60
result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_cond,
result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60
result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60
result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60
result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60
result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_return_output);

-- lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60
lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_cond,
lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue,
lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse,
lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674
BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_left,
BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_right,
BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c
result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c
result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l254_c7_e78c
result_pc_MUX_uxn_opcodes_h_l254_c7_e78c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_cond,
result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue,
result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse,
result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c
result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c
result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_cond,
result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c
result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c
result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c
result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_return_output);

-- lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c
lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_cond,
lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue,
lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse,
lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l257_c15_391c
BIN_OP_PLUS_uxn_opcodes_h_l257_c15_391c : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l257_c15_391c_left,
BIN_OP_PLUS_uxn_opcodes_h_l257_c15_391c_right,
BIN_OP_PLUS_uxn_opcodes_h_l257_c15_391c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86
BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_left,
BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_right,
BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e
result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e
result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_return_output);

-- result_pc_MUX_uxn_opcodes_h_l260_c7_367e
result_pc_MUX_uxn_opcodes_h_l260_c7_367e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l260_c7_367e_cond,
result_pc_MUX_uxn_opcodes_h_l260_c7_367e_iftrue,
result_pc_MUX_uxn_opcodes_h_l260_c7_367e_iffalse,
result_pc_MUX_uxn_opcodes_h_l260_c7_367e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e
result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e
result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_cond,
result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e
result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e
result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e
result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c
BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_left,
BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_right,
BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728
result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_cond,
result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728
result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728
result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728
result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_return_output);

-- result_pc_MUX_uxn_opcodes_h_l266_c7_c728
result_pc_MUX_uxn_opcodes_h_l266_c7_c728 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l266_c7_c728_cond,
result_pc_MUX_uxn_opcodes_h_l266_c7_c728_iftrue,
result_pc_MUX_uxn_opcodes_h_l266_c7_c728_iffalse,
result_pc_MUX_uxn_opcodes_h_l266_c7_c728_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728
result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_cond,
result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728
result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 lit_tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
 result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
 lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_return_output,
 result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_return_output,
 lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_return_output,
 result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_return_output,
 lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_return_output,
 result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_return_output,
 lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l257_c15_391c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_return_output,
 result_pc_MUX_uxn_opcodes_h_l260_c7_367e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_return_output,
 result_pc_MUX_uxn_opcodes_h_l266_c7_c728_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l239_c3_02c4 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l236_c2_f2fa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l237_c3_6f4c_uxn_opcodes_h_l237_c3_6f4c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l243_c7_8f41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_return_output : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_cond : unsigned(0 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_return_output : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l257_c3_35fd : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_367e_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_cond : unsigned(0 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_391c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_391c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_391c_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_367e_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_367e_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_c728_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_367e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l263_c3_5d64 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l269_c3_ff2e : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_c728_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l272_c3_0909 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_c728_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_c728_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l271_c3_63fa : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_140d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_5af2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l260_l266_l236_l254_DUPLICATE_6ec8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_eabe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_001f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l260_l266_l236_DUPLICATE_f772_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_a3a4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l249_l236_DUPLICATE_f22a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_fe6c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_cb80_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ebc_uxn_opcodes_h_l231_l276_DUPLICATE_4255_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_lit_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_lit_tmp8 := lit_tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_value_uxn_opcodes_h_l271_c3_63fa := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_iftrue := VAR_result_stack_value_uxn_opcodes_h_l271_c3_63fa;
     VAR_result_pc_uxn_opcodes_h_l272_c3_0909 := resize(to_unsigned(0, 1), 16);
     VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_c728_iftrue := VAR_result_pc_uxn_opcodes_h_l272_c3_0909;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_iffalse := to_unsigned(0, 1);
     VAR_result_ram_addr_uxn_opcodes_h_l269_c3_ff2e := resize(to_unsigned(0, 1), 16);
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l269_c3_ff2e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l239_c3_02c4 := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l239_c3_02c4;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_391c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l263_c3_5d64 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l263_c3_5d64;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_iftrue := VAR_CLOCK_ENABLE;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue := lit_tmp8;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue := lit_tmp8;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue := lit_tmp8;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse := lit_tmp8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_iftrue := lit_tmp8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_391c_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_left := VAR_phase;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue := VAR_previous_ram_read;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l236_c2_f2fa] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l236_c2_f2fa_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l254_c11_2674] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_left;
     BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_return_output := BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_140d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_140d_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_cb80 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_cb80_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_5af2 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_5af2_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l260_c11_ec86] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_left;
     BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_return_output := BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_a3a4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_a3a4_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l257_c15_391c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l257_c15_391c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_391c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l257_c15_391c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_391c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_391c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l257_c15_391c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l243_c11_9486] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_left;
     BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_return_output := BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_eabe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_eabe_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_001f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_001f_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l249_c11_0054] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_left;
     BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_return_output := BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l260_l266_l236_DUPLICATE_f772 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l260_l266_l236_DUPLICATE_f772_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l266_c11_a82c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_left;
     BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_return_output := BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l260_l266_l236_l254_DUPLICATE_6ec8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l260_l266_l236_l254_DUPLICATE_6ec8_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_fe6c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_fe6c_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l249_l236_DUPLICATE_f22a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l249_l236_DUPLICATE_f22a_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l236_c6_66b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l243_c7_8f41] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l243_c7_8f41_return_output := result.is_sp_shift;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l236_c2_f2fa] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l236_c2_f2fa_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_return_output;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_66b6_return_output;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_9486_return_output;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0054_return_output;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_2674_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_367e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ec86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_c728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_a82c_return_output;
     VAR_result_pc_uxn_opcodes_h_l257_c3_35fd := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_391c_return_output, 16);
     VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_5af2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_5af2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_5af2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_367e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_5af2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_c728_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_5af2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l260_l266_l236_l254_DUPLICATE_6ec8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l260_l266_l236_l254_DUPLICATE_6ec8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l260_l266_l236_l254_DUPLICATE_6ec8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l260_l266_l236_l254_DUPLICATE_6ec8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_cb80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_cb80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_cb80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_cb80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_cb80_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_fe6c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_fe6c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_fe6c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_fe6c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_fe6c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l260_l266_l236_DUPLICATE_f772_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l260_l266_l236_DUPLICATE_f772_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l260_l266_l236_DUPLICATE_f772_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l249_l236_DUPLICATE_f22a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l249_l236_DUPLICATE_f22a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_eabe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_eabe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_eabe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_eabe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_eabe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_140d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_140d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_140d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_140d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_140d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_a3a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_a3a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_a3a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_a3a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_a3a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_001f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_001f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_001f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_001f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_001f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l243_c7_8f41_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l236_c2_f2fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l236_c2_f2fa_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue := VAR_result_pc_uxn_opcodes_h_l257_c3_35fd;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l260_c7_367e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l260_c7_367e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l249_c7_ce60] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l236_c1_ccf3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l236_c2_f2fa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l243_c7_8f41] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l266_c7_c728] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_return_output := result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_return_output;

     -- lit_tmp8_MUX[uxn_opcodes_h_l254_c7_e78c] LATENCY=0
     -- Inputs
     lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_cond <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_cond;
     lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue;
     lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse;
     -- Outputs
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_return_output := lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l266_c7_c728] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l236_c2_f2fa] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l266_c7_c728] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_cond;
     result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_return_output := result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l266_c7_c728] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l266_c7_c728] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l266_c7_c728] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l266_c7_c728_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_c728_cond;
     result_pc_MUX_uxn_opcodes_h_l266_c7_c728_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_c728_iftrue;
     result_pc_MUX_uxn_opcodes_h_l266_c7_c728_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_c728_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_c728_return_output := result_pc_MUX_uxn_opcodes_h_l266_c7_c728_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l266_c7_c728] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l237_c3_6f4c_uxn_opcodes_h_l237_c3_6f4c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_ccf3_return_output;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse := VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_e78c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_c728_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_c728_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_c728_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_ce60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_367e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_c728_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_367e_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_c728_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_c728_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_367e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_c728_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l260_c7_367e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l260_c7_367e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l243_c7_8f41] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l260_c7_367e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_return_output := result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l260_c7_367e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_return_output;

     -- lit_tmp8_MUX[uxn_opcodes_h_l249_c7_ce60] LATENCY=0
     -- Inputs
     lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_cond <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_cond;
     lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue;
     lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse;
     -- Outputs
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_return_output := lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_return_output;

     -- printf_uxn_opcodes_h_l237_c3_6f4c[uxn_opcodes_h_l237_c3_6f4c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l237_c3_6f4c_uxn_opcodes_h_l237_c3_6f4c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l237_c3_6f4c_uxn_opcodes_h_l237_c3_6f4c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l254_c7_e78c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l260_c7_367e] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l236_c2_f2fa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l254_c7_e78c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l260_c7_367e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l260_c7_367e] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l260_c7_367e_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_367e_cond;
     result_pc_MUX_uxn_opcodes_h_l260_c7_367e_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_367e_iftrue;
     result_pc_MUX_uxn_opcodes_h_l260_c7_367e_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_367e_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_367e_return_output := result_pc_MUX_uxn_opcodes_h_l260_c7_367e_return_output;

     -- Submodule level 3
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse := VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_ce60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_367e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_367e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_367e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_e78c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_367e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_367e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_367e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_e78c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_367e_return_output;
     -- lit_tmp8_MUX[uxn_opcodes_h_l243_c7_8f41] LATENCY=0
     -- Inputs
     lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_cond <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_cond;
     lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue;
     lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse;
     -- Outputs
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_return_output := lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l254_c7_e78c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l254_c7_e78c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_return_output := result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l249_c7_ce60] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l254_c7_e78c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l249_c7_ce60] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l254_c7_e78c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l236_c2_f2fa] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l254_c7_e78c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l254_c7_e78c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l254_c7_e78c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_cond;
     result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_return_output := result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_return_output;

     -- Submodule level 4
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse := VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_e78c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_e78c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_e78c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_ce60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_e78c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_e78c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_e78c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_ce60_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_e78c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l249_c7_ce60] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l249_c7_ce60] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_cond;
     result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue;
     result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_return_output := result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_return_output;

     -- lit_tmp8_MUX[uxn_opcodes_h_l236_c2_f2fa] LATENCY=0
     -- Inputs
     lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_cond <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_cond;
     lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue;
     lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse;
     -- Outputs
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output := lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l249_c7_ce60] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_return_output := result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l243_c7_8f41] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l249_c7_ce60] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l249_c7_ce60] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l243_c7_8f41] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l249_c7_ce60] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l249_c7_ce60] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_cond;
     result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_return_output := result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_return_output;

     -- Submodule level 5
     REG_VAR_lit_tmp8 := VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_ce60_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_ce60_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_ce60_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_ce60_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_ce60_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_ce60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_ce60_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l243_c7_8f41] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_cond;
     result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_return_output := result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l243_c7_8f41] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l243_c7_8f41] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l243_c7_8f41] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_cond;
     result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue;
     result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_return_output := result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l243_c7_8f41] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_return_output := result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l236_c2_f2fa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l243_c7_8f41] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l243_c7_8f41] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l236_c2_f2fa] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8f41_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l236_c2_f2fa] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l236_c2_f2fa] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_cond;
     result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue;
     result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output := result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l236_c2_f2fa] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output := result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l236_c2_f2fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l236_c2_f2fa] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l236_c2_f2fa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output := result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l236_c2_f2fa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5ebc_uxn_opcodes_h_l231_l276_DUPLICATE_4255 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ebc_uxn_opcodes_h_l231_l276_DUPLICATE_4255_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5ebc(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_f2fa_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ebc_uxn_opcodes_h_l231_l276_DUPLICATE_4255_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ebc_uxn_opcodes_h_l231_l276_DUPLICATE_4255_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_lit_tmp8 <= REG_VAR_lit_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     lit_tmp8 <= REG_COMB_lit_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
