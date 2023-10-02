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
-- Submodules: 102
entity lit2_0CLK_83f22136 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit2_0CLK_83f22136;
architecture arch of lit2_0CLK_83f22136 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal lit2_tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_lit2_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l284_c6_9879]
signal BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l284_c1_c2d4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l284_c2_9591]
signal lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l284_c2_9591]
signal result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l284_c2_9591]
signal result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l284_c2_9591]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l284_c2_9591]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l284_c2_9591]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l284_c2_9591]
signal result_pc_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l284_c2_9591]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l284_c2_9591]
signal result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l284_c2_9591]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l284_c2_9591]
signal result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l284_c2_9591]
signal result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l284_c2_9591]
signal result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l284_c2_9591]
signal result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l285_c3_b01f[uxn_opcodes_h_l285_c3_b01f]
signal printf_uxn_opcodes_h_l285_c3_b01f_uxn_opcodes_h_l285_c3_b01f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l291_c11_4d3b]
signal BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l291_c7_cda9]
signal lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l291_c7_cda9]
signal result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l291_c7_cda9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l291_c7_cda9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l291_c7_cda9]
signal result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l291_c7_cda9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l291_c7_cda9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l291_c7_cda9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l291_c7_cda9]
signal result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l291_c7_cda9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l291_c7_cda9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l291_c7_cda9]
signal result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l297_c11_a475]
signal BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l297_c7_aaf6]
signal lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l297_c7_aaf6]
signal result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l297_c7_aaf6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l297_c7_aaf6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l297_c7_aaf6]
signal result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l297_c7_aaf6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l297_c7_aaf6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l297_c7_aaf6]
signal result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l297_c7_aaf6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l297_c7_aaf6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l297_c7_aaf6]
signal result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l302_c11_5f24]
signal BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l302_c7_e20e]
signal lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l302_c7_e20e]
signal result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l302_c7_e20e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l302_c7_e20e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l302_c7_e20e]
signal result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l302_c7_e20e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l302_c7_e20e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l302_c7_e20e]
signal result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l302_c7_e20e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l302_c7_e20e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l302_c7_e20e]
signal result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l304_c3_448d]
signal CONST_SL_8_uxn_opcodes_h_l304_c3_448d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l304_c3_448d_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l307_c21_cfdf]
signal BIN_OP_PLUS_uxn_opcodes_h_l307_c21_cfdf_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l307_c21_cfdf_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l307_c21_cfdf_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l309_c11_163d]
signal BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l309_c7_a115]
signal lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l309_c7_a115]
signal result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l309_c7_a115]
signal result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l309_c7_a115]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l309_c7_a115]
signal result_pc_MUX_uxn_opcodes_h_l309_c7_a115_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l309_c7_a115_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l309_c7_a115_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l309_c7_a115_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l309_c7_a115]
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l309_c7_a115]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l309_c7_a115]
signal result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l309_c7_a115]
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l309_c7_a115]
signal result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l309_c7_a115]
signal result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l312_c21_39f6]
signal BIN_OP_PLUS_uxn_opcodes_h_l312_c21_39f6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l312_c21_39f6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l312_c21_39f6_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l314_c11_711f]
signal BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l314_c7_d797]
signal lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l314_c7_d797]
signal result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l314_c7_d797]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l314_c7_d797]
signal result_pc_MUX_uxn_opcodes_h_l314_c7_d797_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l314_c7_d797_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l314_c7_d797_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l314_c7_d797_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l314_c7_d797]
signal result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l314_c7_d797]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l314_c7_d797]
signal result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l314_c7_d797]
signal result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l314_c7_d797]
signal result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l314_c7_d797]
signal result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l315_c3_bf35]
signal BIN_OP_OR_uxn_opcodes_h_l315_c3_bf35_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l315_c3_bf35_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l315_c3_bf35_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l318_c15_559a]
signal BIN_OP_PLUS_uxn_opcodes_h_l318_c15_559a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l318_c15_559a_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l318_c15_559a_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l320_c11_cd47]
signal BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l320_c7_1253]
signal result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l320_c7_1253]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l320_c7_1253]
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l320_c7_1253]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l320_c7_1253]
signal result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l320_c7_1253]
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l320_c7_1253]
signal result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l320_c7_1253]
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l329_c11_214e]
signal BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l329_c7_2c6c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l329_c7_2c6c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l329_c7_2c6c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l329_c7_2c6c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l329_c7_2c6c]
signal result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l333_c34_63d5]
signal CONST_SR_8_uxn_opcodes_h_l333_c34_63d5_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l333_c34_63d5_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879
BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_left,
BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_right,
BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591
lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591
result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_cond,
result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591
result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591
result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_return_output);

-- result_pc_MUX_uxn_opcodes_h_l284_c2_9591
result_pc_MUX_uxn_opcodes_h_l284_c2_9591 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l284_c2_9591_cond,
result_pc_MUX_uxn_opcodes_h_l284_c2_9591_iftrue,
result_pc_MUX_uxn_opcodes_h_l284_c2_9591_iffalse,
result_pc_MUX_uxn_opcodes_h_l284_c2_9591_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591
result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591
result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591
result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591
result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591
result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591
result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591
result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_cond,
result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_return_output);

-- printf_uxn_opcodes_h_l285_c3_b01f_uxn_opcodes_h_l285_c3_b01f
printf_uxn_opcodes_h_l285_c3_b01f_uxn_opcodes_h_l285_c3_b01f : entity work.printf_uxn_opcodes_h_l285_c3_b01f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l285_c3_b01f_uxn_opcodes_h_l285_c3_b01f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b
BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_left,
BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_right,
BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9
lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9
result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9
result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_return_output);

-- result_pc_MUX_uxn_opcodes_h_l291_c7_cda9
result_pc_MUX_uxn_opcodes_h_l291_c7_cda9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_cond,
result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue,
result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse,
result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9
result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9
result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9
result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9
result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9
result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9
result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9
result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_cond,
result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475
BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_left,
BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_right,
BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6
lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6
result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6
result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output);

-- result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6
result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_cond,
result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue,
result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse,
result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6
result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6
result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6
result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6
result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6
result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6
result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_cond,
result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24
BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_left,
BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_right,
BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e
lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e
result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e
result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_return_output);

-- result_pc_MUX_uxn_opcodes_h_l302_c7_e20e
result_pc_MUX_uxn_opcodes_h_l302_c7_e20e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_cond,
result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue,
result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse,
result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e
result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e
result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e
result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e
result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e
result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e
result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_cond,
result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_return_output);

-- CONST_SL_8_uxn_opcodes_h_l304_c3_448d
CONST_SL_8_uxn_opcodes_h_l304_c3_448d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l304_c3_448d_x,
CONST_SL_8_uxn_opcodes_h_l304_c3_448d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l307_c21_cfdf
BIN_OP_PLUS_uxn_opcodes_h_l307_c21_cfdf : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l307_c21_cfdf_left,
BIN_OP_PLUS_uxn_opcodes_h_l307_c21_cfdf_right,
BIN_OP_PLUS_uxn_opcodes_h_l307_c21_cfdf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d
BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_left,
BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_right,
BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115
lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115
result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_cond,
result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115
result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_return_output);

-- result_pc_MUX_uxn_opcodes_h_l309_c7_a115
result_pc_MUX_uxn_opcodes_h_l309_c7_a115 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l309_c7_a115_cond,
result_pc_MUX_uxn_opcodes_h_l309_c7_a115_iftrue,
result_pc_MUX_uxn_opcodes_h_l309_c7_a115_iffalse,
result_pc_MUX_uxn_opcodes_h_l309_c7_a115_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115
result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115
result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115
result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115
result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_cond,
result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l312_c21_39f6
BIN_OP_PLUS_uxn_opcodes_h_l312_c21_39f6 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l312_c21_39f6_left,
BIN_OP_PLUS_uxn_opcodes_h_l312_c21_39f6_right,
BIN_OP_PLUS_uxn_opcodes_h_l312_c21_39f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f
BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_left,
BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_right,
BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797
lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797
result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_cond,
result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_return_output);

-- result_pc_MUX_uxn_opcodes_h_l314_c7_d797
result_pc_MUX_uxn_opcodes_h_l314_c7_d797 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l314_c7_d797_cond,
result_pc_MUX_uxn_opcodes_h_l314_c7_d797_iftrue,
result_pc_MUX_uxn_opcodes_h_l314_c7_d797_iffalse,
result_pc_MUX_uxn_opcodes_h_l314_c7_d797_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797
result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797
result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797
result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797
result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_cond,
result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l315_c3_bf35
BIN_OP_OR_uxn_opcodes_h_l315_c3_bf35 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l315_c3_bf35_left,
BIN_OP_OR_uxn_opcodes_h_l315_c3_bf35_right,
BIN_OP_OR_uxn_opcodes_h_l315_c3_bf35_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l318_c15_559a
BIN_OP_PLUS_uxn_opcodes_h_l318_c15_559a : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l318_c15_559a_left,
BIN_OP_PLUS_uxn_opcodes_h_l318_c15_559a_right,
BIN_OP_PLUS_uxn_opcodes_h_l318_c15_559a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47
BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_left,
BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_right,
BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253
result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_cond,
result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253
result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253
result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253
result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_cond,
result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e
BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_left,
BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_right,
BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c
result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c
result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_cond,
result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l333_c34_63d5
CONST_SR_8_uxn_opcodes_h_l333_c34_63d5 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l333_c34_63d5_x,
CONST_SR_8_uxn_opcodes_h_l333_c34_63d5_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 lit2_tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
 result_pc_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_return_output,
 result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output,
 result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_return_output,
 result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_return_output,
 CONST_SL_8_uxn_opcodes_h_l304_c3_448d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l307_c21_cfdf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_return_output,
 result_pc_MUX_uxn_opcodes_h_l309_c7_a115_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l312_c21_39f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_return_output,
 result_pc_MUX_uxn_opcodes_h_l314_c7_d797_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_return_output,
 BIN_OP_OR_uxn_opcodes_h_l315_c3_bf35_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l318_c15_559a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output,
 CONST_SR_8_uxn_opcodes_h_l333_c34_63d5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_iffalse : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l287_c3_dc98 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l284_c2_9591_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l285_c3_b01f_uxn_opcodes_h_l285_c3_b01f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_return_output : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l291_c7_cda9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_return_output : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_return_output : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l307_c3_81ec : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_a115_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l304_c3_448d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l304_c3_448d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_cfdf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_cfdf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_cfdf_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_return_output : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l312_c3_377c : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_a115_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_a115_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_d797_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_a115_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_39f6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_39f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_39f6_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_return_output : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_d797_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l318_c3_9ba3 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_d797_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_d797_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_bf35_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_bf35_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_bf35_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_559a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_559a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_559a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l322_c3_2c45 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l326_c3_cb37 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l327_c24_6b32_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l332_c3_7b92 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_3a39 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l333_c34_63d5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l333_c34_63d5_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l333_c24_b825_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l320_l314_l284_DUPLICATE_80ae_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l309_l284_DUPLICATE_f4d1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_1cc3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_0417_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_16c5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l291_l284_l320_l309_l302_l297_DUPLICATE_38df_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l320_l284_DUPLICATE_02a8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_96eb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_23db_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l291_l329_l320_l314_l309_l302_l297_DUPLICATE_3943_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l315_l303_DUPLICATE_4353_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3ddb_uxn_opcodes_h_l279_l341_DUPLICATE_85ed_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_lit2_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_lit2_tmp16 := lit2_tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_sp_relative_shift_uxn_opcodes_h_l287_c3_dc98 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l287_c3_dc98;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l332_c3_7b92 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l332_c3_7b92;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_right := to_unsigned(7, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_right := to_unsigned(6, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_559a_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_cfdf_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_right := to_unsigned(3, 2);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue := to_unsigned(1, 1);
     VAR_result_ram_addr_uxn_opcodes_h_l322_c3_2c45 := resize(to_unsigned(0, 1), 16);
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l322_c3_2c45;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_39f6_right := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_3a39 := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_3a39;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l326_c3_cb37 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l326_c3_cb37;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_right := to_unsigned(5, 3);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_bf35_left := lit2_tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l333_c34_63d5_x := lit2_tmp16;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_iftrue := lit2_tmp16;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue := lit2_tmp16;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue := lit2_tmp16;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_iftrue := lit2_tmp16;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_iffalse := lit2_tmp16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_cfdf_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_39f6_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_559a_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_left := VAR_phase;
     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l320_l314_l284_DUPLICATE_80ae LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l320_l314_l284_DUPLICATE_80ae_return_output := result.ram_addr;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l284_c2_9591] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l284_c2_9591_return_output := result.sp_relative_shift;

     -- CONST_SR_8[uxn_opcodes_h_l333_c34_63d5] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l333_c34_63d5_x <= VAR_CONST_SR_8_uxn_opcodes_h_l333_c34_63d5_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l333_c34_63d5_return_output := CONST_SR_8_uxn_opcodes_h_l333_c34_63d5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l314_c11_711f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_left;
     BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_return_output := BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l309_c11_163d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_left;
     BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_return_output := BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l327_c24_6b32] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l327_c24_6b32_return_output := CAST_TO_uint8_t_uint16_t(
     lit2_tmp16);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l284_c2_9591] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l284_c2_9591_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l320_l284_DUPLICATE_02a8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l320_l284_DUPLICATE_02a8_return_output := result.is_ram_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l291_l284_l320_l309_l302_l297_DUPLICATE_38df LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l291_l284_l320_l309_l302_l297_DUPLICATE_38df_return_output := result.is_pc_updated;

     -- BIN_OP_PLUS[uxn_opcodes_h_l312_c21_39f6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l312_c21_39f6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_39f6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l312_c21_39f6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_39f6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_39f6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l312_c21_39f6_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l291_c7_cda9] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l291_c7_cda9_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l302_c11_5f24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_left;
     BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_return_output := BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l297_c11_a475] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_left;
     BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_return_output := BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l309_l284_DUPLICATE_f4d1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l309_l284_DUPLICATE_f4d1_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_96eb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_96eb_return_output := result.is_stack_read;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l315_l303_DUPLICATE_4353 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l315_l303_DUPLICATE_4353_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l307_c21_cfdf] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l307_c21_cfdf_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_cfdf_left;
     BIN_OP_PLUS_uxn_opcodes_h_l307_c21_cfdf_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_cfdf_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_cfdf_return_output := BIN_OP_PLUS_uxn_opcodes_h_l307_c21_cfdf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_16c5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_16c5_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l329_c11_214e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_left;
     BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_return_output := BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_0417 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_0417_return_output := result.pc;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_1cc3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_1cc3_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l320_c11_cd47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_left;
     BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_return_output := BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l291_l329_l320_l314_l309_l302_l297_DUPLICATE_3943 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l291_l329_l320_l314_l309_l302_l297_DUPLICATE_3943_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l284_c6_9879] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_left;
     BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_return_output := BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_23db LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_23db_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l291_c11_4d3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_left;
     BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_return_output := BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l318_c15_559a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l318_c15_559a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_559a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l318_c15_559a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_559a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_559a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l318_c15_559a_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_9591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_9879_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_4d3b_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_a475_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_5f24_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_a115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_163d_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_d797_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_711f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_cd47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_214e_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l307_c3_81ec := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_cfdf_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l312_c3_377c := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_39f6_return_output, 16);
     VAR_result_pc_uxn_opcodes_h_l318_c3_9ba3 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_559a_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_bf35_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l315_l303_DUPLICATE_4353_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l304_c3_448d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l315_l303_DUPLICATE_4353_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l327_c24_6b32_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_9591_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_0417_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_0417_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_0417_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_0417_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_a115_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_0417_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_d797_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_0417_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l320_l314_l284_DUPLICATE_80ae_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l320_l314_l284_DUPLICATE_80ae_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l320_l314_l284_DUPLICATE_80ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l291_l329_l320_l314_l309_l302_l297_DUPLICATE_3943_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l291_l329_l320_l314_l309_l302_l297_DUPLICATE_3943_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l291_l329_l320_l314_l309_l302_l297_DUPLICATE_3943_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l291_l329_l320_l314_l309_l302_l297_DUPLICATE_3943_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l291_l329_l320_l314_l309_l302_l297_DUPLICATE_3943_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l291_l329_l320_l314_l309_l302_l297_DUPLICATE_3943_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l291_l329_l320_l314_l309_l302_l297_DUPLICATE_3943_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l291_l284_l320_l309_l302_l297_DUPLICATE_38df_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l291_l284_l320_l309_l302_l297_DUPLICATE_38df_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l291_l284_l320_l309_l302_l297_DUPLICATE_38df_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l291_l284_l320_l309_l302_l297_DUPLICATE_38df_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l291_l284_l320_l309_l302_l297_DUPLICATE_38df_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l291_l284_l320_l309_l302_l297_DUPLICATE_38df_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l320_l284_DUPLICATE_02a8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l320_l284_DUPLICATE_02a8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l309_l284_DUPLICATE_f4d1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l309_l284_DUPLICATE_f4d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_96eb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_96eb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_96eb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_96eb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_96eb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_96eb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_96eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_16c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_16c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_16c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_16c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_16c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_16c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_1cc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_1cc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_1cc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_1cc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_1cc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_1cc3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_23db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_23db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_23db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_23db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_23db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_23db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_23db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l291_c7_cda9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l284_c2_9591_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l284_c2_9591_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_d797_iftrue := VAR_result_pc_uxn_opcodes_h_l318_c3_9ba3;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l307_c3_81ec;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l312_c3_377c;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l284_c2_9591] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l291_c7_cda9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l329_c7_2c6c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l284_c1_c2d4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l315_c3_bf35] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l315_c3_bf35_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_bf35_left;
     BIN_OP_OR_uxn_opcodes_h_l315_c3_bf35_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_bf35_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_bf35_return_output := BIN_OP_OR_uxn_opcodes_h_l315_c3_bf35_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l314_c7_d797] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l314_c7_d797_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_d797_cond;
     result_pc_MUX_uxn_opcodes_h_l314_c7_d797_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_d797_iftrue;
     result_pc_MUX_uxn_opcodes_h_l314_c7_d797_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_d797_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_d797_return_output := result_pc_MUX_uxn_opcodes_h_l314_c7_d797_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l320_c7_1253] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l284_c2_9591] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l320_c7_1253] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l333_c24_b825] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l333_c24_b825_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l333_c34_63d5_return_output);

     -- CONST_SL_8[uxn_opcodes_h_l304_c3_448d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l304_c3_448d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l304_c3_448d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l304_c3_448d_return_output := CONST_SL_8_uxn_opcodes_h_l304_c3_448d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l329_c7_2c6c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l329_c7_2c6c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l309_c7_a115] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l320_c7_1253] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_return_output := result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l329_c7_2c6c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output;

     -- Submodule level 2
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_bf35_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l333_c24_b825_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l304_c3_448d_return_output;
     VAR_printf_uxn_opcodes_h_l285_c3_b01f_uxn_opcodes_h_l285_c3_b01f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_c2d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_1253_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_1253_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_a115_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_a115_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_d797_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_1253_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l284_c2_9591] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_return_output;

     -- printf_uxn_opcodes_h_l285_c3_b01f[uxn_opcodes_h_l285_c3_b01f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l285_c3_b01f_uxn_opcodes_h_l285_c3_b01f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l285_c3_b01f_uxn_opcodes_h_l285_c3_b01f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_ram_addr_MUX[uxn_opcodes_h_l314_c7_d797] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_return_output := result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l320_c7_1253] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l302_c7_e20e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l314_c7_d797] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l309_c7_a115] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l309_c7_a115_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_a115_cond;
     result_pc_MUX_uxn_opcodes_h_l309_c7_a115_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_a115_iftrue;
     result_pc_MUX_uxn_opcodes_h_l309_c7_a115_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_a115_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_a115_return_output := result_pc_MUX_uxn_opcodes_h_l309_c7_a115_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l314_c7_d797] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l314_c7_d797] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l329_c7_2c6c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output := result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l320_c7_1253] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l320_c7_1253] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l320_c7_1253] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_return_output;

     -- Submodule level 3
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_iffalse := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_d797_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_1253_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_d797_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_d797_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_e20e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_1253_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_1253_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_a115_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_d797_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_1253_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_2c6c_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l320_c7_1253] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_cond;
     result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_return_output := result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l297_c7_aaf6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l314_c7_d797] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l309_c7_a115] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l314_c7_d797] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l309_c7_a115] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_return_output := result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l314_c7_d797] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l314_c7_d797] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l309_c7_a115] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l309_c7_a115] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l302_c7_e20e] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_cond;
     result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue;
     result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_return_output := result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_return_output;

     -- Submodule level 4
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_a115_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_d797_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_a115_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_a115_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_d797_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_d797_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_e20e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_a115_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_d797_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_1253_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l314_c7_d797] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_cond;
     result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_return_output := result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l302_c7_e20e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l309_c7_a115] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l302_c7_e20e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l302_c7_e20e] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l302_c7_e20e] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l297_c7_aaf6] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_cond;
     result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue;
     result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output := result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l291_c7_cda9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l309_c7_a115] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l309_c7_a115] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l309_c7_a115] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_return_output;

     -- Submodule level 5
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_e20e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_a115_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_e20e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_e20e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_a115_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_a115_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_e20e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_a115_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_d797_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l284_c2_9591] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l291_c7_cda9] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_cond;
     result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue;
     result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_return_output := result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l302_c7_e20e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l302_c7_e20e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l297_c7_aaf6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l297_c7_aaf6] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l302_c7_e20e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l297_c7_aaf6] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l297_c7_aaf6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l302_c7_e20e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l309_c7_a115] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_cond;
     result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_return_output := result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_return_output;

     -- Submodule level 6
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_e20e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_e20e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_e20e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_9591_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_e20e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_a115_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l291_c7_cda9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l291_c7_cda9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l297_c7_aaf6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l291_c7_cda9] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l297_c7_aaf6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l302_c7_e20e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_return_output := result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l291_c7_cda9] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l284_c2_9591] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l284_c2_9591_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_9591_cond;
     result_pc_MUX_uxn_opcodes_h_l284_c2_9591_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_9591_iftrue;
     result_pc_MUX_uxn_opcodes_h_l284_c2_9591_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_9591_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_9591_return_output := result_pc_MUX_uxn_opcodes_h_l284_c2_9591_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l297_c7_aaf6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l297_c7_aaf6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output;

     -- Submodule level 7
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_iffalse := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_e20e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l291_c7_cda9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l291_c7_cda9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l291_c7_cda9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l284_c2_9591] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l291_c7_cda9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l284_c2_9591] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_return_output := result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l284_c2_9591] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l297_c7_aaf6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output := result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l284_c2_9591] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_return_output;

     -- Submodule level 8
     REG_VAR_lit2_tmp16 := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_9591_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_aaf6_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l291_c7_cda9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_return_output := result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l284_c2_9591] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l284_c2_9591] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l284_c2_9591] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l284_c2_9591] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_return_output;

     -- Submodule level 9
     VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_cda9_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l284_c2_9591] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_cond;
     result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_return_output := result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3ddb_uxn_opcodes_h_l279_l341_DUPLICATE_85ed LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3ddb_uxn_opcodes_h_l279_l341_DUPLICATE_85ed_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3ddb(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_9591_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_9591_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3ddb_uxn_opcodes_h_l279_l341_DUPLICATE_85ed_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3ddb_uxn_opcodes_h_l279_l341_DUPLICATE_85ed_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_lit2_tmp16 <= REG_VAR_lit2_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     lit2_tmp16 <= REG_COMB_lit2_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
