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
-- BIN_OP_EQ[uxn_opcodes_h_l236_c6_12d0]
signal BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l236_c1_294e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_return_output : unsigned(0 downto 0);

-- lit_tmp8_MUX[uxn_opcodes_h_l236_c2_4577]
signal lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l236_c2_4577]
signal result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l236_c2_4577]
signal result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l236_c2_4577]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l236_c2_4577]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l236_c2_4577]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l236_c2_4577]
signal result_pc_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l236_c2_4577]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l236_c2_4577]
signal result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l236_c2_4577]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l236_c2_4577]
signal result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l236_c2_4577]
signal result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l236_c2_4577]
signal result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l236_c2_4577]
signal result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l237_c3_585c[uxn_opcodes_h_l237_c3_585c]
signal printf_uxn_opcodes_h_l237_c3_585c_uxn_opcodes_h_l237_c3_585c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l243_c11_8c1a]
signal BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_return_output : unsigned(0 downto 0);

-- lit_tmp8_MUX[uxn_opcodes_h_l243_c7_8a22]
signal lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l243_c7_8a22]
signal result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l243_c7_8a22]
signal result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l243_c7_8a22]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l243_c7_8a22]
signal result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l243_c7_8a22]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l243_c7_8a22]
signal result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l243_c7_8a22]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l243_c7_8a22]
signal result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l243_c7_8a22]
signal result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l243_c7_8a22]
signal result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l243_c7_8a22]
signal result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l249_c11_a07c]
signal BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_return_output : unsigned(0 downto 0);

-- lit_tmp8_MUX[uxn_opcodes_h_l249_c7_bbcc]
signal lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_cond : unsigned(0 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l249_c7_bbcc]
signal result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l249_c7_bbcc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l249_c7_bbcc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l249_c7_bbcc]
signal result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l249_c7_bbcc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l249_c7_bbcc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l249_c7_bbcc]
signal result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l249_c7_bbcc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l249_c7_bbcc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l249_c7_bbcc]
signal result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l254_c11_c316]
signal BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_return_output : unsigned(0 downto 0);

-- lit_tmp8_MUX[uxn_opcodes_h_l254_c7_87e4]
signal lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_cond : unsigned(0 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l254_c7_87e4]
signal result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l254_c7_87e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l254_c7_87e4]
signal result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l254_c7_87e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l254_c7_87e4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l254_c7_87e4]
signal result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l254_c7_87e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l254_c7_87e4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l254_c7_87e4]
signal result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l257_c15_7db9]
signal BIN_OP_PLUS_uxn_opcodes_h_l257_c15_7db9_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l257_c15_7db9_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l257_c15_7db9_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l260_c11_27fd]
signal BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l260_c7_ebf4]
signal result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l260_c7_ebf4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l260_c7_ebf4]
signal result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l260_c7_ebf4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l260_c7_ebf4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l260_c7_ebf4]
signal result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l260_c7_ebf4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l260_c7_ebf4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l260_c7_ebf4]
signal result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l266_c11_99e4]
signal BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l266_c7_65ed]
signal result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l266_c7_65ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l266_c7_65ed]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l266_c7_65ed]
signal result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l266_c7_65ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l266_c7_65ed]
signal result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l266_c7_65ed]
signal result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0
BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_left,
BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_right,
BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_return_output);

-- lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577
lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_cond,
lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_iftrue,
lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_iffalse,
lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577
result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_cond,
result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577
result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577
result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_return_output);

-- result_pc_MUX_uxn_opcodes_h_l236_c2_4577
result_pc_MUX_uxn_opcodes_h_l236_c2_4577 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l236_c2_4577_cond,
result_pc_MUX_uxn_opcodes_h_l236_c2_4577_iftrue,
result_pc_MUX_uxn_opcodes_h_l236_c2_4577_iffalse,
result_pc_MUX_uxn_opcodes_h_l236_c2_4577_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577
result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577
result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577
result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577
result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577
result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577
result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577
result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_cond,
result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_return_output);

-- printf_uxn_opcodes_h_l237_c3_585c_uxn_opcodes_h_l237_c3_585c
printf_uxn_opcodes_h_l237_c3_585c_uxn_opcodes_h_l237_c3_585c : entity work.printf_uxn_opcodes_h_l237_c3_585c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l237_c3_585c_uxn_opcodes_h_l237_c3_585c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a
BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_left,
BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_right,
BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_return_output);

-- lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22
lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_cond,
lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue,
lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse,
lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22
result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_cond,
result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22
result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_return_output);

-- result_pc_MUX_uxn_opcodes_h_l243_c7_8a22
result_pc_MUX_uxn_opcodes_h_l243_c7_8a22 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_cond,
result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue,
result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse,
result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22
result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22
result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22
result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22
result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22
result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22
result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22
result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_cond,
result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c
BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_left,
BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_right,
BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_return_output);

-- lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc
lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_cond,
lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue,
lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse,
lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc
result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_cond,
result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc
result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output);

-- result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc
result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_cond,
result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue,
result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse,
result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc
result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc
result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc
result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc
result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc
result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc
result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_cond,
result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316
BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_left,
BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_right,
BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_return_output);

-- lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4
lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_cond,
lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue,
lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse,
lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4
result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_return_output);

-- result_pc_MUX_uxn_opcodes_h_l254_c7_87e4
result_pc_MUX_uxn_opcodes_h_l254_c7_87e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_cond,
result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue,
result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse,
result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4
result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4
result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4
result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4
result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4
result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4
result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_cond,
result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l257_c15_7db9
BIN_OP_PLUS_uxn_opcodes_h_l257_c15_7db9 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l257_c15_7db9_left,
BIN_OP_PLUS_uxn_opcodes_h_l257_c15_7db9_right,
BIN_OP_PLUS_uxn_opcodes_h_l257_c15_7db9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd
BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_left,
BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_right,
BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4
result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output);

-- result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4
result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_cond,
result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue,
result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse,
result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4
result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4
result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4
result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4
result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4
result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4
result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_cond,
result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4
BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_left,
BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_right,
BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed
result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_cond,
result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed
result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed
result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed
result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed
result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed
result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_cond,
result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_return_output);

-- result_pc_MUX_uxn_opcodes_h_l266_c7_65ed
result_pc_MUX_uxn_opcodes_h_l266_c7_65ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_cond,
result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue,
result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse,
result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_return_output,
 lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
 result_pc_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_return_output,
 lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_return_output,
 result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_return_output,
 lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output,
 result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_return_output,
 lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_return_output,
 result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l257_c15_7db9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output,
 result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_return_output,
 result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_iffalse : unsigned(0 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l239_c3_ec13 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l236_c2_4577_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l237_c3_585c_uxn_opcodes_h_l237_c3_585c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_return_output : unsigned(0 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l243_c7_8a22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_return_output : unsigned(0 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_return_output : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_return_output : unsigned(0 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l257_c3_ca8f : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_7db9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_7db9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_7db9_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l263_c3_2cfc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l269_c3_2776 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l271_c3_ca3b : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l272_c3_cf13 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l260_l266_l236_l254_DUPLICATE_d395_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l249_l236_DUPLICATE_8cae_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_19b5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_d66b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_aa27_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_941d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l260_l266_l236_DUPLICATE_c5da_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_d24c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_ed76_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_09da_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3ddb_uxn_opcodes_h_l231_l276_DUPLICATE_5b71_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_7db9_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue := to_unsigned(0, 1);
     VAR_result_stack_value_uxn_opcodes_h_l271_c3_ca3b := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue := VAR_result_stack_value_uxn_opcodes_h_l271_c3_ca3b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l263_c3_2cfc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l263_c3_2cfc;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_right := to_unsigned(5, 3);
     VAR_result_pc_uxn_opcodes_h_l272_c3_cf13 := resize(to_unsigned(0, 1), 16);
     VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue := VAR_result_pc_uxn_opcodes_h_l272_c3_cf13;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_right := to_unsigned(4, 3);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l239_c3_ec13 := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l239_c3_ec13;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_iftrue := to_unsigned(0, 1);
     VAR_result_ram_addr_uxn_opcodes_h_l269_c3_2776 := resize(to_unsigned(0, 1), 16);
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l269_c3_2776;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_iftrue := VAR_CLOCK_ENABLE;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_iftrue := lit_tmp8;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue := lit_tmp8;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue := lit_tmp8;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse := lit_tmp8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue := lit_tmp8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_7db9_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_left := VAR_phase;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue := VAR_previous_ram_read;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_19b5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_19b5_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l243_c11_8c1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_left;
     BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_return_output := BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l266_c11_99e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l249_c11_a07c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_left;
     BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_return_output := BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_09da LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_09da_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_d24c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_d24c_return_output := result.is_stack_read;

     -- BIN_OP_PLUS[uxn_opcodes_h_l257_c15_7db9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l257_c15_7db9_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_7db9_left;
     BIN_OP_PLUS_uxn_opcodes_h_l257_c15_7db9_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_7db9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_7db9_return_output := BIN_OP_PLUS_uxn_opcodes_h_l257_c15_7db9_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l236_c2_4577] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l236_c2_4577_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_ed76 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_ed76_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l260_c11_27fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l236_c2_4577] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l236_c2_4577_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l236_c6_12d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_aa27 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_aa27_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l260_l266_l236_DUPLICATE_c5da LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l260_l266_l236_DUPLICATE_c5da_return_output := result.is_ram_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l249_l236_DUPLICATE_8cae LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l249_l236_DUPLICATE_8cae_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l254_c11_c316] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_left;
     BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_return_output := BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l243_c7_8a22] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l243_c7_8a22_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l260_l266_l236_l254_DUPLICATE_d395 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l260_l266_l236_l254_DUPLICATE_d395_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_941d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_941d_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_d66b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_d66b_return_output := result.pc;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_return_output;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_4577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_12d0_return_output;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_8c1a_return_output;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_a07c_return_output;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_c316_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_27fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_99e4_return_output;
     VAR_result_pc_uxn_opcodes_h_l257_c3_ca8f := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_7db9_return_output, 16);
     VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_4577_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_d66b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_d66b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_d66b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_d66b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_d66b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l260_l266_l236_l254_DUPLICATE_d395_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l260_l266_l236_l254_DUPLICATE_d395_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l260_l266_l236_l254_DUPLICATE_d395_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l260_l266_l236_l254_DUPLICATE_d395_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_09da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_09da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_09da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_09da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_09da_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_941d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_941d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_941d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_941d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_941d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l260_l266_l236_DUPLICATE_c5da_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l260_l266_l236_DUPLICATE_c5da_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l260_l266_l236_DUPLICATE_c5da_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l249_l236_DUPLICATE_8cae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l249_l236_DUPLICATE_8cae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_d24c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_d24c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_d24c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_d24c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_d24c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_aa27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_aa27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_aa27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_aa27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_aa27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_19b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_19b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_19b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_19b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_19b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_ed76_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_ed76_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_ed76_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_ed76_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_ed76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l243_c7_8a22_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l236_c2_4577_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l236_c2_4577_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue := VAR_result_pc_uxn_opcodes_h_l257_c3_ca8f;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l243_c7_8a22] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l266_c7_65ed] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_return_output := result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l266_c7_65ed] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_return_output;

     -- lit_tmp8_MUX[uxn_opcodes_h_l254_c7_87e4] LATENCY=0
     -- Inputs
     lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_cond <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_cond;
     lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue;
     lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse;
     -- Outputs
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_return_output := lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l236_c2_4577] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l266_c7_65ed] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_cond;
     result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue;
     result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_return_output := result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l249_c7_bbcc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l260_c7_ebf4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l260_c7_ebf4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l236_c2_4577] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l266_c7_65ed] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_cond;
     result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_return_output := result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l236_c1_294e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l266_c7_65ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l266_c7_65ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l266_c7_65ed] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l237_c3_585c_uxn_opcodes_h_l237_c3_585c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_294e_return_output;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse := VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_87e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_65ed_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_65ed_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_65ed_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_65ed_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_65ed_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_65ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_65ed_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l260_c7_ebf4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output := result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l260_c7_ebf4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output;

     -- lit_tmp8_MUX[uxn_opcodes_h_l249_c7_bbcc] LATENCY=0
     -- Inputs
     lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_cond <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_cond;
     lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue;
     lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse;
     -- Outputs
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output := lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l260_c7_ebf4] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l260_c7_ebf4] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_cond;
     result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue;
     result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output := result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l254_c7_87e4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l254_c7_87e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l260_c7_ebf4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output;

     -- printf_uxn_opcodes_h_l237_c3_585c[uxn_opcodes_h_l237_c3_585c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l237_c3_585c_uxn_opcodes_h_l237_c3_585c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l237_c3_585c_uxn_opcodes_h_l237_c3_585c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l260_c7_ebf4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l243_c7_8a22] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l260_c7_ebf4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l236_c2_4577] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_return_output;

     -- Submodule level 3
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse := VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_87e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_87e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_ebf4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l254_c7_87e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l236_c2_4577] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l254_c7_87e4] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_cond;
     result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue;
     result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_return_output := result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l254_c7_87e4] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l254_c7_87e4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l254_c7_87e4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l249_c7_bbcc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output;

     -- lit_tmp8_MUX[uxn_opcodes_h_l243_c7_8a22] LATENCY=0
     -- Inputs
     lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_cond <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_cond;
     lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue;
     lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse;
     -- Outputs
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_return_output := lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l249_c7_bbcc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l254_c7_87e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l254_c7_87e4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_return_output := result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_return_output;

     -- Submodule level 4
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_iffalse := VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_87e4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_87e4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_87e4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_87e4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_87e4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_87e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_87e4_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l249_c7_bbcc] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_cond;
     result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue;
     result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output := result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l249_c7_bbcc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l249_c7_bbcc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l243_c7_8a22] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l249_c7_bbcc] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l249_c7_bbcc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output := result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l249_c7_bbcc] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output := result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l249_c7_bbcc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output;

     -- lit_tmp8_MUX[uxn_opcodes_h_l236_c2_4577] LATENCY=0
     -- Inputs
     lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_cond <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_cond;
     lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_iftrue <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_iftrue;
     lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_iffalse <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_iffalse;
     -- Outputs
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_return_output := lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l243_c7_8a22] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;

     -- Submodule level 5
     REG_VAR_lit_tmp8 := VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_4577_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_bbcc_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l243_c7_8a22] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_cond;
     result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_return_output := result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l243_c7_8a22] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_return_output := result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l236_c2_4577] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l243_c7_8a22] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_cond;
     result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue;
     result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_return_output := result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l243_c7_8a22] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l243_c7_8a22] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l243_c7_8a22] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l236_c2_4577] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l243_c7_8a22] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_4577_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_8a22_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l236_c2_4577] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l236_c2_4577] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_return_output := result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l236_c2_4577] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l236_c2_4577_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_4577_cond;
     result_pc_MUX_uxn_opcodes_h_l236_c2_4577_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_4577_iftrue;
     result_pc_MUX_uxn_opcodes_h_l236_c2_4577_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_4577_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_4577_return_output := result_pc_MUX_uxn_opcodes_h_l236_c2_4577_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l236_c2_4577] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l236_c2_4577] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l236_c2_4577] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_cond;
     result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_return_output := result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l236_c2_4577] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3ddb_uxn_opcodes_h_l231_l276_DUPLICATE_5b71 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3ddb_uxn_opcodes_h_l231_l276_DUPLICATE_5b71_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3ddb(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_4577_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_4577_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3ddb_uxn_opcodes_h_l231_l276_DUPLICATE_5b71_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3ddb_uxn_opcodes_h_l231_l276_DUPLICATE_5b71_return_output;
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
