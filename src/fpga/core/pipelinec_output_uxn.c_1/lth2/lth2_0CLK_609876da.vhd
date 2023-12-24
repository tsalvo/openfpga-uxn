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
-- Submodules: 58
entity lth2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_609876da;
architecture arch of lth2_0CLK_609876da is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1941_c6_bf85]
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1941_c2_e818]
signal n16_MUX_uxn_opcodes_h_l1941_c2_e818_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1941_c2_e818]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1941_c2_e818]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1941_c2_e818]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1941_c2_e818]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1941_c2_e818]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1941_c2_e818]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1941_c2_e818]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1941_c2_e818]
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1941_c2_e818]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1941_c2_e818]
signal t16_MUX_uxn_opcodes_h_l1941_c2_e818_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1954_c11_1b81]
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1954_c7_ca7b]
signal n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1954_c7_ca7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1954_c7_ca7b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1954_c7_ca7b]
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1954_c7_ca7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1954_c7_ca7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1954_c7_ca7b]
signal t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1957_c11_3af3]
signal BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1957_c7_4cb1]
signal n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1957_c7_4cb1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1957_c7_4cb1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1957_c7_4cb1]
signal result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1957_c7_4cb1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1957_c7_4cb1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1957_c7_4cb1]
signal t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1962_c11_45c5]
signal BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1962_c7_7a11]
signal n16_MUX_uxn_opcodes_h_l1962_c7_7a11_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1962_c7_7a11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1962_c7_7a11]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1962_c7_7a11]
signal result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1962_c7_7a11]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1962_c7_7a11]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1962_c7_7a11]
signal t16_MUX_uxn_opcodes_h_l1962_c7_7a11_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1963_c3_43df]
signal BIN_OP_OR_uxn_opcodes_h_l1963_c3_43df_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1963_c3_43df_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1963_c3_43df_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1966_c11_71f0]
signal BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1966_c7_ff10]
signal n16_MUX_uxn_opcodes_h_l1966_c7_ff10_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1966_c7_ff10]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1966_c7_ff10]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1966_c7_ff10]
signal result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1966_c7_ff10]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1966_c7_ff10]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1970_c11_32db]
signal BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1970_c7_14d3]
signal n16_MUX_uxn_opcodes_h_l1970_c7_14d3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1970_c7_14d3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1970_c7_14d3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1970_c7_14d3]
signal result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1970_c7_14d3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1970_c7_14d3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1971_c3_2505]
signal BIN_OP_OR_uxn_opcodes_h_l1971_c3_2505_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1971_c3_2505_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1971_c3_2505_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1972_c30_d000]
signal sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1975_c21_3192]
signal BIN_OP_LT_uxn_opcodes_h_l1975_c21_3192_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1975_c21_3192_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1975_c21_3192_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1975_c21_78dd]
signal MUX_uxn_opcodes_h_l1975_c21_78dd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1975_c21_78dd_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1975_c21_78dd_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1975_c21_78dd_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_4f1d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_4f1d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_4f1d_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a47b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85
BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_left,
BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_right,
BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_return_output);

-- n16_MUX_uxn_opcodes_h_l1941_c2_e818
n16_MUX_uxn_opcodes_h_l1941_c2_e818 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1941_c2_e818_cond,
n16_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue,
n16_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse,
n16_MUX_uxn_opcodes_h_l1941_c2_e818_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818
result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818
result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818
result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_cond,
result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818
result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_return_output);

-- t16_MUX_uxn_opcodes_h_l1941_c2_e818
t16_MUX_uxn_opcodes_h_l1941_c2_e818 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1941_c2_e818_cond,
t16_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue,
t16_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse,
t16_MUX_uxn_opcodes_h_l1941_c2_e818_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_left,
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_right,
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_return_output);

-- n16_MUX_uxn_opcodes_h_l1954_c7_ca7b
n16_MUX_uxn_opcodes_h_l1954_c7_ca7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond,
n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue,
n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse,
n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output);

-- t16_MUX_uxn_opcodes_h_l1954_c7_ca7b
t16_MUX_uxn_opcodes_h_l1954_c7_ca7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond,
t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue,
t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse,
t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3
BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_left,
BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_right,
BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_return_output);

-- n16_MUX_uxn_opcodes_h_l1957_c7_4cb1
n16_MUX_uxn_opcodes_h_l1957_c7_4cb1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond,
n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue,
n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse,
n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1
result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output);

-- t16_MUX_uxn_opcodes_h_l1957_c7_4cb1
t16_MUX_uxn_opcodes_h_l1957_c7_4cb1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond,
t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue,
t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse,
t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5
BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_left,
BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_right,
BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_return_output);

-- n16_MUX_uxn_opcodes_h_l1962_c7_7a11
n16_MUX_uxn_opcodes_h_l1962_c7_7a11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1962_c7_7a11_cond,
n16_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue,
n16_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse,
n16_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11
result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11
result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11
result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_cond,
result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11
result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output);

-- t16_MUX_uxn_opcodes_h_l1962_c7_7a11
t16_MUX_uxn_opcodes_h_l1962_c7_7a11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1962_c7_7a11_cond,
t16_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue,
t16_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse,
t16_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1963_c3_43df
BIN_OP_OR_uxn_opcodes_h_l1963_c3_43df : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1963_c3_43df_left,
BIN_OP_OR_uxn_opcodes_h_l1963_c3_43df_right,
BIN_OP_OR_uxn_opcodes_h_l1963_c3_43df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_left,
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_right,
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_return_output);

-- n16_MUX_uxn_opcodes_h_l1966_c7_ff10
n16_MUX_uxn_opcodes_h_l1966_c7_ff10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1966_c7_ff10_cond,
n16_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue,
n16_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse,
n16_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10
result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10
result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_cond,
result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db
BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_left,
BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_right,
BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_return_output);

-- n16_MUX_uxn_opcodes_h_l1970_c7_14d3
n16_MUX_uxn_opcodes_h_l1970_c7_14d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1970_c7_14d3_cond,
n16_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue,
n16_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse,
n16_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3
result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1971_c3_2505
BIN_OP_OR_uxn_opcodes_h_l1971_c3_2505 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1971_c3_2505_left,
BIN_OP_OR_uxn_opcodes_h_l1971_c3_2505_right,
BIN_OP_OR_uxn_opcodes_h_l1971_c3_2505_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1972_c30_d000
sp_relative_shift_uxn_opcodes_h_l1972_c30_d000 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_ins,
sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_x,
sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_y,
sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1975_c21_3192
BIN_OP_LT_uxn_opcodes_h_l1975_c21_3192 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1975_c21_3192_left,
BIN_OP_LT_uxn_opcodes_h_l1975_c21_3192_right,
BIN_OP_LT_uxn_opcodes_h_l1975_c21_3192_return_output);

-- MUX_uxn_opcodes_h_l1975_c21_78dd
MUX_uxn_opcodes_h_l1975_c21_78dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1975_c21_78dd_cond,
MUX_uxn_opcodes_h_l1975_c21_78dd_iftrue,
MUX_uxn_opcodes_h_l1975_c21_78dd_iffalse,
MUX_uxn_opcodes_h_l1975_c21_78dd_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_4f1d
CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_4f1d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_4f1d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_4f1d_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_return_output,
 n16_MUX_uxn_opcodes_h_l1941_c2_e818_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_return_output,
 t16_MUX_uxn_opcodes_h_l1941_c2_e818_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_return_output,
 n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output,
 t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_return_output,
 n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output,
 t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_return_output,
 n16_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output,
 t16_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1963_c3_43df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_return_output,
 n16_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_return_output,
 n16_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1971_c3_2505_return_output,
 sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1975_c21_3192_return_output,
 MUX_uxn_opcodes_h_l1975_c21_78dd_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_4f1d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c2_e818_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1946_c3_8623 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1951_c3_504f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c2_e818_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c2_e818_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1955_c3_6dc3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1960_c3_8303 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1962_c7_7a11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1964_c3_422f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1962_c7_7a11_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1963_c3_43df_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1963_c3_43df_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1963_c3_43df_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1966_c7_ff10_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1970_c7_14d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1974_c3_5531 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1971_c3_2505_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1971_c3_2505_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1971_c3_2505_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1975_c21_78dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1975_c21_3192_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1975_c21_3192_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1975_c21_3192_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1975_c21_78dd_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1975_c21_78dd_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1975_c21_78dd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1941_l1970_l1966_l1962_l1957_DUPLICATE_1add_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_95ce_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_5227_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_5358_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1958_l1967_l1963_l1971_DUPLICATE_842c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_4f1d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_4f1d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1966_l1970_DUPLICATE_2ac8_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1979_l1937_DUPLICATE_46ee_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1964_c3_422f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1964_c3_422f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1960_c3_8303 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1960_c3_8303;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1946_c3_8623 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1946_c3_8623;
     VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_y := resize(to_signed(-3, 3), 4);
     VAR_MUX_uxn_opcodes_h_l1975_c21_78dd_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1974_c3_5531 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1974_c3_5531;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1955_c3_6dc3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1955_c3_6dc3;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1975_c21_78dd_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1951_c3_504f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1951_c3_504f;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1971_c3_2505_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1975_c21_3192_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1963_c3_43df_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1941_c6_bf85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_left;
     BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_return_output := BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_5227 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_5227_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1958_l1967_l1963_l1971_DUPLICATE_842c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1958_l1967_l1963_l1971_DUPLICATE_842c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1941_l1970_l1966_l1962_l1957_DUPLICATE_1add LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1941_l1970_l1966_l1962_l1957_DUPLICATE_1add_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_5358 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_5358_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1941_c2_e818] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1941_c2_e818_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1954_c11_1b81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_left;
     BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_return_output := BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1970_c11_32db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_left;
     BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_return_output := BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1941_c2_e818] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1941_c2_e818_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1957_c11_3af3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_95ce LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_95ce_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1966_l1970_DUPLICATE_2ac8 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1966_l1970_DUPLICATE_2ac8_return_output := result.stack_address_sp_offset;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1941_c2_e818] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1941_c2_e818_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1941_c2_e818] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1941_c2_e818_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l1972_c30_d000] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_ins;
     sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_x;
     sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_return_output := sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1966_c11_71f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1962_c11_45c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1941_c2_e818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1941_c2_e818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_bf85_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1b81_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_3af3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1962_c7_7a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1962_c7_7a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_45c5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1966_c7_ff10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_71f0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1970_c7_14d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_32db_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1963_c3_43df_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1958_l1967_l1963_l1971_DUPLICATE_842c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1971_c3_2505_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1958_l1967_l1963_l1971_DUPLICATE_842c_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_4f1d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1958_l1967_l1963_l1971_DUPLICATE_842c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_5227_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_5227_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_5227_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_5227_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_5227_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_95ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_95ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_95ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_95ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_95ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_5358_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_5358_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_5358_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_5358_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1970_l1966_l1962_l1957_DUPLICATE_5358_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1966_l1970_DUPLICATE_2ac8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1966_l1970_DUPLICATE_2ac8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1941_l1970_l1966_l1962_l1957_DUPLICATE_1add_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1941_l1970_l1966_l1962_l1957_DUPLICATE_1add_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1941_l1970_l1966_l1962_l1957_DUPLICATE_1add_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1941_l1970_l1966_l1962_l1957_DUPLICATE_1add_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1941_l1970_l1966_l1962_l1957_DUPLICATE_1add_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1941_l1970_l1966_l1962_l1957_DUPLICATE_1add_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1941_c2_e818_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1941_c2_e818_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1941_c2_e818_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1941_c2_e818_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_d000_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l1941_c2_e818] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1971_c3_2505] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1971_c3_2505_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1971_c3_2505_left;
     BIN_OP_OR_uxn_opcodes_h_l1971_c3_2505_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1971_c3_2505_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1971_c3_2505_return_output := BIN_OP_OR_uxn_opcodes_h_l1971_c3_2505_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_4f1d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_4f1d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_4f1d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_4f1d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_4f1d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1970_c7_14d3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1941_c2_e818] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1963_c3_43df] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1963_c3_43df_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1963_c3_43df_left;
     BIN_OP_OR_uxn_opcodes_h_l1963_c3_43df_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1963_c3_43df_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1963_c3_43df_return_output := BIN_OP_OR_uxn_opcodes_h_l1963_c3_43df_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1970_c7_14d3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1970_c7_14d3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1941_c2_e818] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1970_c7_14d3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1941_c2_e818] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1963_c3_43df_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1975_c21_3192_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1971_c3_2505_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1971_c3_2505_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_4f1d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_4f1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output;
     -- BIN_OP_LT[uxn_opcodes_h_l1975_c21_3192] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1975_c21_3192_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1975_c21_3192_left;
     BIN_OP_LT_uxn_opcodes_h_l1975_c21_3192_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1975_c21_3192_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1975_c21_3192_return_output := BIN_OP_LT_uxn_opcodes_h_l1975_c21_3192_return_output;

     -- t16_MUX[uxn_opcodes_h_l1962_c7_7a11] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1962_c7_7a11_cond <= VAR_t16_MUX_uxn_opcodes_h_l1962_c7_7a11_cond;
     t16_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue;
     t16_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output := t16_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1966_c7_ff10] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1966_c7_ff10] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1966_c7_ff10] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output;

     -- n16_MUX[uxn_opcodes_h_l1970_c7_14d3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1970_c7_14d3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1970_c7_14d3_cond;
     n16_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue;
     n16_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output := n16_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1966_c7_ff10] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1975_c21_78dd_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1975_c21_3192_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output;
     -- MUX[uxn_opcodes_h_l1975_c21_78dd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1975_c21_78dd_cond <= VAR_MUX_uxn_opcodes_h_l1975_c21_78dd_cond;
     MUX_uxn_opcodes_h_l1975_c21_78dd_iftrue <= VAR_MUX_uxn_opcodes_h_l1975_c21_78dd_iftrue;
     MUX_uxn_opcodes_h_l1975_c21_78dd_iffalse <= VAR_MUX_uxn_opcodes_h_l1975_c21_78dd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1975_c21_78dd_return_output := MUX_uxn_opcodes_h_l1975_c21_78dd_return_output;

     -- n16_MUX[uxn_opcodes_h_l1966_c7_ff10] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1966_c7_ff10_cond <= VAR_n16_MUX_uxn_opcodes_h_l1966_c7_ff10_cond;
     n16_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue;
     n16_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output := n16_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1962_c7_7a11] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1962_c7_7a11] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1962_c7_7a11] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1962_c7_7a11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output;

     -- t16_MUX[uxn_opcodes_h_l1957_c7_4cb1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond;
     t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue;
     t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output := t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue := VAR_MUX_uxn_opcodes_h_l1975_c21_78dd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output;
     -- t16_MUX[uxn_opcodes_h_l1954_c7_ca7b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond;
     t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue;
     t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output := t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1970_c7_14d3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1957_c7_4cb1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1962_c7_7a11] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1962_c7_7a11_cond <= VAR_n16_MUX_uxn_opcodes_h_l1962_c7_7a11_cond;
     n16_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue;
     n16_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output := n16_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1957_c7_4cb1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1957_c7_4cb1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1957_c7_4cb1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_14d3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1954_c7_ca7b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1954_c7_ca7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1954_c7_ca7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1957_c7_4cb1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond;
     n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue;
     n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output := n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1941_c2_e818] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1941_c2_e818_cond <= VAR_t16_MUX_uxn_opcodes_h_l1941_c2_e818_cond;
     t16_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue;
     t16_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1941_c2_e818_return_output := t16_MUX_uxn_opcodes_h_l1941_c2_e818_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1966_c7_ff10] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output := result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1954_c7_ca7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_ff10_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1941_c2_e818_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1941_c2_e818] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1941_c2_e818] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_return_output;

     -- n16_MUX[uxn_opcodes_h_l1954_c7_ca7b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond;
     n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue;
     n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output := n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1962_c7_7a11] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output := result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1941_c2_e818] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1941_c2_e818] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_7a11_return_output;
     -- n16_MUX[uxn_opcodes_h_l1941_c2_e818] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1941_c2_e818_cond <= VAR_n16_MUX_uxn_opcodes_h_l1941_c2_e818_cond;
     n16_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue;
     n16_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1941_c2_e818_return_output := n16_MUX_uxn_opcodes_h_l1941_c2_e818_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1957_c7_4cb1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1941_c2_e818_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_4cb1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1954_c7_ca7b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_ca7b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1941_c2_e818] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_return_output := result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1979_l1937_DUPLICATE_46ee LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1979_l1937_DUPLICATE_46ee_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a47b(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_e818_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_e818_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_e818_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_e818_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_e818_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_e818_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_e818_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_e818_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_e818_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1979_l1937_DUPLICATE_46ee_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1979_l1937_DUPLICATE_46ee_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
