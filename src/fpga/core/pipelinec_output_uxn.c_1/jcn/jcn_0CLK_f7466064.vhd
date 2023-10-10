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
-- Submodules: 61
entity jcn_0CLK_f7466064 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn_0CLK_f7466064;
architecture arch of jcn_0CLK_f7466064 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l712_c6_4274]
signal BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l712_c1_50da]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l712_c2_aba4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l712_c2_aba4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l712_c2_aba4]
signal result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l712_c2_aba4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l712_c2_aba4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l712_c2_aba4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l712_c2_aba4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l712_c2_aba4]
signal t8_MUX_uxn_opcodes_h_l712_c2_aba4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l712_c2_aba4_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l712_c2_aba4]
signal n8_MUX_uxn_opcodes_h_l712_c2_aba4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l712_c2_aba4_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l713_c3_eff9[uxn_opcodes_h_l713_c3_eff9]
signal printf_uxn_opcodes_h_l713_c3_eff9_uxn_opcodes_h_l713_c3_eff9_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l718_c11_48b6]
signal BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l718_c7_c988]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l718_c7_c988]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l718_c7_c988]
signal result_pc_MUX_uxn_opcodes_h_l718_c7_c988_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l718_c7_c988_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l718_c7_c988_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l718_c7_c988_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l718_c7_c988]
signal result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l718_c7_c988]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l718_c7_c988]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l718_c7_c988]
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l718_c7_c988]
signal t8_MUX_uxn_opcodes_h_l718_c7_c988_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l718_c7_c988_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l718_c7_c988_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l718_c7_c988_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l718_c7_c988]
signal n8_MUX_uxn_opcodes_h_l718_c7_c988_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l718_c7_c988_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l718_c7_c988_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l718_c7_c988_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l721_c11_cd13]
signal BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l721_c7_8875]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l721_c7_8875]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l721_c7_8875]
signal result_pc_MUX_uxn_opcodes_h_l721_c7_8875_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l721_c7_8875_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l721_c7_8875_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l721_c7_8875_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l721_c7_8875]
signal result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l721_c7_8875]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l721_c7_8875]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l721_c7_8875]
signal result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l721_c7_8875]
signal t8_MUX_uxn_opcodes_h_l721_c7_8875_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l721_c7_8875_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l721_c7_8875_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l721_c7_8875_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l721_c7_8875]
signal n8_MUX_uxn_opcodes_h_l721_c7_8875_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l721_c7_8875_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l721_c7_8875_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l721_c7_8875_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l725_c11_9961]
signal BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l725_c7_3045]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l725_c7_3045]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l725_c7_3045]
signal result_pc_MUX_uxn_opcodes_h_l725_c7_3045_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l725_c7_3045_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l725_c7_3045_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l725_c7_3045_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l725_c7_3045]
signal result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l725_c7_3045]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l725_c7_3045]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l725_c7_3045]
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l725_c7_3045]
signal n8_MUX_uxn_opcodes_h_l725_c7_3045_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l725_c7_3045_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l725_c7_3045_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l725_c7_3045_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l728_c11_29d8]
signal BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l728_c7_5acf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l728_c7_5acf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l728_c7_5acf]
signal result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l728_c7_5acf]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l728_c7_5acf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l728_c7_5acf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l728_c7_5acf]
signal n8_MUX_uxn_opcodes_h_l728_c7_5acf_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l728_c7_5acf_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l732_c32_acc6]
signal BIN_OP_AND_uxn_opcodes_h_l732_c32_acc6_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l732_c32_acc6_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l732_c32_acc6_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l732_c32_3061]
signal BIN_OP_GT_uxn_opcodes_h_l732_c32_3061_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l732_c32_3061_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l732_c32_3061_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l732_c32_fad5]
signal MUX_uxn_opcodes_h_l732_c32_fad5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l732_c32_fad5_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l732_c32_fad5_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l732_c32_fad5_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l734_c15_c068]
signal BIN_OP_EQ_uxn_opcodes_h_l734_c15_c068_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l734_c15_c068_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l734_c15_c068_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l734_c30_add8]
signal BIN_OP_PLUS_uxn_opcodes_h_l734_c30_add8_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l734_c30_add8_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l734_c30_add8_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l734_c15_6899]
signal MUX_uxn_opcodes_h_l734_c15_6899_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l734_c15_6899_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l734_c15_6899_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l734_c15_6899_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l736_c11_7ecb]
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l736_c7_49e8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l736_c7_49e8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l736_c7_49e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_cc54( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.pc := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274
BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_left,
BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_right,
BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_return_output);

-- result_pc_MUX_uxn_opcodes_h_l712_c2_aba4
result_pc_MUX_uxn_opcodes_h_l712_c2_aba4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_cond,
result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue,
result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse,
result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4
result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4
result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4
result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_return_output);

-- t8_MUX_uxn_opcodes_h_l712_c2_aba4
t8_MUX_uxn_opcodes_h_l712_c2_aba4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l712_c2_aba4_cond,
t8_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue,
t8_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse,
t8_MUX_uxn_opcodes_h_l712_c2_aba4_return_output);

-- n8_MUX_uxn_opcodes_h_l712_c2_aba4
n8_MUX_uxn_opcodes_h_l712_c2_aba4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l712_c2_aba4_cond,
n8_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue,
n8_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse,
n8_MUX_uxn_opcodes_h_l712_c2_aba4_return_output);

-- printf_uxn_opcodes_h_l713_c3_eff9_uxn_opcodes_h_l713_c3_eff9
printf_uxn_opcodes_h_l713_c3_eff9_uxn_opcodes_h_l713_c3_eff9 : entity work.printf_uxn_opcodes_h_l713_c3_eff9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l713_c3_eff9_uxn_opcodes_h_l713_c3_eff9_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6
BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_left,
BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_right,
BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988
result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_return_output);

-- result_pc_MUX_uxn_opcodes_h_l718_c7_c988
result_pc_MUX_uxn_opcodes_h_l718_c7_c988 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l718_c7_c988_cond,
result_pc_MUX_uxn_opcodes_h_l718_c7_c988_iftrue,
result_pc_MUX_uxn_opcodes_h_l718_c7_c988_iffalse,
result_pc_MUX_uxn_opcodes_h_l718_c7_c988_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988
result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_return_output);

-- t8_MUX_uxn_opcodes_h_l718_c7_c988
t8_MUX_uxn_opcodes_h_l718_c7_c988 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l718_c7_c988_cond,
t8_MUX_uxn_opcodes_h_l718_c7_c988_iftrue,
t8_MUX_uxn_opcodes_h_l718_c7_c988_iffalse,
t8_MUX_uxn_opcodes_h_l718_c7_c988_return_output);

-- n8_MUX_uxn_opcodes_h_l718_c7_c988
n8_MUX_uxn_opcodes_h_l718_c7_c988 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l718_c7_c988_cond,
n8_MUX_uxn_opcodes_h_l718_c7_c988_iftrue,
n8_MUX_uxn_opcodes_h_l718_c7_c988_iffalse,
n8_MUX_uxn_opcodes_h_l718_c7_c988_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13
BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_left,
BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_right,
BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875
result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875
result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_return_output);

-- result_pc_MUX_uxn_opcodes_h_l721_c7_8875
result_pc_MUX_uxn_opcodes_h_l721_c7_8875 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l721_c7_8875_cond,
result_pc_MUX_uxn_opcodes_h_l721_c7_8875_iftrue,
result_pc_MUX_uxn_opcodes_h_l721_c7_8875_iffalse,
result_pc_MUX_uxn_opcodes_h_l721_c7_8875_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875
result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875
result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875
result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_return_output);

-- t8_MUX_uxn_opcodes_h_l721_c7_8875
t8_MUX_uxn_opcodes_h_l721_c7_8875 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l721_c7_8875_cond,
t8_MUX_uxn_opcodes_h_l721_c7_8875_iftrue,
t8_MUX_uxn_opcodes_h_l721_c7_8875_iffalse,
t8_MUX_uxn_opcodes_h_l721_c7_8875_return_output);

-- n8_MUX_uxn_opcodes_h_l721_c7_8875
n8_MUX_uxn_opcodes_h_l721_c7_8875 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l721_c7_8875_cond,
n8_MUX_uxn_opcodes_h_l721_c7_8875_iftrue,
n8_MUX_uxn_opcodes_h_l721_c7_8875_iffalse,
n8_MUX_uxn_opcodes_h_l721_c7_8875_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961
BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_left,
BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_right,
BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_return_output);

-- result_pc_MUX_uxn_opcodes_h_l725_c7_3045
result_pc_MUX_uxn_opcodes_h_l725_c7_3045 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l725_c7_3045_cond,
result_pc_MUX_uxn_opcodes_h_l725_c7_3045_iftrue,
result_pc_MUX_uxn_opcodes_h_l725_c7_3045_iffalse,
result_pc_MUX_uxn_opcodes_h_l725_c7_3045_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045
result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045
result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_return_output);

-- n8_MUX_uxn_opcodes_h_l725_c7_3045
n8_MUX_uxn_opcodes_h_l725_c7_3045 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l725_c7_3045_cond,
n8_MUX_uxn_opcodes_h_l725_c7_3045_iftrue,
n8_MUX_uxn_opcodes_h_l725_c7_3045_iffalse,
n8_MUX_uxn_opcodes_h_l725_c7_3045_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8
BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_left,
BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_right,
BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf
result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf
result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_return_output);

-- result_pc_MUX_uxn_opcodes_h_l728_c7_5acf
result_pc_MUX_uxn_opcodes_h_l728_c7_5acf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_cond,
result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue,
result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse,
result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf
result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_return_output);

-- n8_MUX_uxn_opcodes_h_l728_c7_5acf
n8_MUX_uxn_opcodes_h_l728_c7_5acf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l728_c7_5acf_cond,
n8_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue,
n8_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse,
n8_MUX_uxn_opcodes_h_l728_c7_5acf_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l732_c32_acc6
BIN_OP_AND_uxn_opcodes_h_l732_c32_acc6 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l732_c32_acc6_left,
BIN_OP_AND_uxn_opcodes_h_l732_c32_acc6_right,
BIN_OP_AND_uxn_opcodes_h_l732_c32_acc6_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l732_c32_3061
BIN_OP_GT_uxn_opcodes_h_l732_c32_3061 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l732_c32_3061_left,
BIN_OP_GT_uxn_opcodes_h_l732_c32_3061_right,
BIN_OP_GT_uxn_opcodes_h_l732_c32_3061_return_output);

-- MUX_uxn_opcodes_h_l732_c32_fad5
MUX_uxn_opcodes_h_l732_c32_fad5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l732_c32_fad5_cond,
MUX_uxn_opcodes_h_l732_c32_fad5_iftrue,
MUX_uxn_opcodes_h_l732_c32_fad5_iffalse,
MUX_uxn_opcodes_h_l732_c32_fad5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l734_c15_c068
BIN_OP_EQ_uxn_opcodes_h_l734_c15_c068 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l734_c15_c068_left,
BIN_OP_EQ_uxn_opcodes_h_l734_c15_c068_right,
BIN_OP_EQ_uxn_opcodes_h_l734_c15_c068_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l734_c30_add8
BIN_OP_PLUS_uxn_opcodes_h_l734_c30_add8 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l734_c30_add8_left,
BIN_OP_PLUS_uxn_opcodes_h_l734_c30_add8_right,
BIN_OP_PLUS_uxn_opcodes_h_l734_c30_add8_return_output);

-- MUX_uxn_opcodes_h_l734_c15_6899
MUX_uxn_opcodes_h_l734_c15_6899 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l734_c15_6899_cond,
MUX_uxn_opcodes_h_l734_c15_6899_iftrue,
MUX_uxn_opcodes_h_l734_c15_6899_iffalse,
MUX_uxn_opcodes_h_l734_c15_6899_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb
BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb_left,
BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb_right,
BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_return_output);



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
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_return_output,
 result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_return_output,
 t8_MUX_uxn_opcodes_h_l712_c2_aba4_return_output,
 n8_MUX_uxn_opcodes_h_l712_c2_aba4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_return_output,
 result_pc_MUX_uxn_opcodes_h_l718_c7_c988_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_return_output,
 t8_MUX_uxn_opcodes_h_l718_c7_c988_return_output,
 n8_MUX_uxn_opcodes_h_l718_c7_c988_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_return_output,
 result_pc_MUX_uxn_opcodes_h_l721_c7_8875_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_return_output,
 t8_MUX_uxn_opcodes_h_l721_c7_8875_return_output,
 n8_MUX_uxn_opcodes_h_l721_c7_8875_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_return_output,
 result_pc_MUX_uxn_opcodes_h_l725_c7_3045_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_return_output,
 n8_MUX_uxn_opcodes_h_l725_c7_3045_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_return_output,
 result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_return_output,
 n8_MUX_uxn_opcodes_h_l728_c7_5acf_return_output,
 BIN_OP_AND_uxn_opcodes_h_l732_c32_acc6_return_output,
 BIN_OP_GT_uxn_opcodes_h_l732_c32_3061_return_output,
 MUX_uxn_opcodes_h_l732_c32_fad5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l734_c15_c068_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l734_c30_add8_return_output,
 MUX_uxn_opcodes_h_l734_c15_6899_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_c988_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l715_c3_bbf8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l718_c7_c988_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l712_c2_aba4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l712_c2_aba4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l718_c7_c988_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l712_c2_aba4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l712_c2_aba4_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l713_c3_eff9_uxn_opcodes_h_l713_c3_eff9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_c988_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_c988_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l721_c7_8875_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_c988_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l719_c3_15d7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l718_c7_c988_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l718_c7_c988_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l721_c7_8875_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l718_c7_c988_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l718_c7_c988_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l718_c7_c988_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l721_c7_8875_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l718_c7_c988_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l721_c7_8875_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l721_c7_8875_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_3045_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l721_c7_8875_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l723_c3_fee5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l721_c7_8875_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l721_c7_8875_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l721_c7_8875_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l721_c7_8875_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l721_c7_8875_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l725_c7_3045_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l721_c7_8875_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_3045_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_3045_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_3045_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l726_c3_c725 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l725_c7_3045_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l725_c7_3045_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l725_c7_3045_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l728_c7_5acf_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l725_c7_3045_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l728_c7_5acf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l732_c32_fad5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l732_c32_fad5_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l732_c32_fad5_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l732_c32_acc6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l732_c32_acc6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l732_c32_acc6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l732_c32_3061_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l732_c32_3061_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l732_c32_3061_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l732_c32_fad5_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l734_c15_6899_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l734_c15_6899_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l734_c15_6899_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c15_c068_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c15_c068_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c15_c068_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l734_c30_add8_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l734_c35_f604_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l734_c30_add8_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l734_c30_add8_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l734_c15_6899_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l725_l721_l718_l712_l736_DUPLICATE_8a35_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l725_l721_l718_l712_l736_DUPLICATE_b8e4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l725_l721_l718_l712_l728_DUPLICATE_0ef4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l725_l721_l718_l712_l728_DUPLICATE_7de0_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l725_l718_l728_l721_DUPLICATE_592e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l725_l721_l718_l736_l728_DUPLICATE_3ccb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc54_uxn_opcodes_h_l742_l708_DUPLICATE_d77f_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c15_c068_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l732_c32_3061_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l732_c32_acc6_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l715_c3_bbf8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l715_c3_bbf8;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l719_c3_15d7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l719_c3_15d7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l723_c3_fee5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l723_c3_fee5;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l732_c32_fad5_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l726_c3_c725 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l726_c3_c725;
     VAR_MUX_uxn_opcodes_h_l732_c32_fad5_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l732_c32_acc6_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l718_c7_c988_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l721_c7_8875_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l725_c7_3045_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l734_c30_add8_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l734_c15_6899_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c15_c068_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l721_c7_8875_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l718_c7_c988_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l721_c7_8875_iffalse := t8;
     -- BIN_OP_AND[uxn_opcodes_h_l732_c32_acc6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l732_c32_acc6_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l732_c32_acc6_left;
     BIN_OP_AND_uxn_opcodes_h_l732_c32_acc6_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l732_c32_acc6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l732_c32_acc6_return_output := BIN_OP_AND_uxn_opcodes_h_l732_c32_acc6_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l725_l721_l718_l712_l728_DUPLICATE_0ef4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l725_l721_l718_l712_l728_DUPLICATE_0ef4_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l718_c11_48b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l725_c11_9961] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_left;
     BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_return_output := BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l725_l721_l718_l736_l728_DUPLICATE_3ccb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l725_l721_l718_l736_l728_DUPLICATE_3ccb_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l728_c11_29d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l734_c35_f604] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l734_c35_f604_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l721_c11_cd13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_left;
     BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_return_output := BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l725_c7_3045] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l725_c7_3045_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l725_l718_l728_l721_DUPLICATE_592e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l725_l718_l728_l721_DUPLICATE_592e_return_output := result.is_stack_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l725_l721_l718_l712_l728_DUPLICATE_7de0 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l725_l721_l718_l712_l728_DUPLICATE_7de0_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l736_c11_7ecb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb_left;
     BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb_return_output := BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l725_l721_l718_l712_l736_DUPLICATE_b8e4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l725_l721_l718_l712_l736_DUPLICATE_b8e4_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l734_c15_c068] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l734_c15_c068_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c15_c068_left;
     BIN_OP_EQ_uxn_opcodes_h_l734_c15_c068_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c15_c068_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c15_c068_return_output := BIN_OP_EQ_uxn_opcodes_h_l734_c15_c068_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l712_c6_4274] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_left;
     BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_return_output := BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l725_l721_l718_l712_l736_DUPLICATE_8a35 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l725_l721_l718_l712_l736_DUPLICATE_8a35_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l732_c32_3061_left := VAR_BIN_OP_AND_uxn_opcodes_h_l732_c32_acc6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l712_c2_aba4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l712_c2_aba4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_4274_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l718_c7_c988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_c988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l718_c7_c988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_48b6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l721_c7_8875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l721_c7_8875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l721_c7_8875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_cd13_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l725_c7_3045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_3045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_9961_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l728_c7_5acf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_29d8_return_output;
     VAR_MUX_uxn_opcodes_h_l734_c15_6899_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c15_c068_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ecb_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l734_c30_add8_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l734_c35_f604_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l725_l721_l718_l712_l728_DUPLICATE_7de0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l725_l721_l718_l712_l728_DUPLICATE_7de0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l725_l721_l718_l712_l728_DUPLICATE_7de0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l725_l721_l718_l712_l728_DUPLICATE_7de0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l725_l721_l718_l712_l728_DUPLICATE_7de0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l725_l721_l718_l712_l728_DUPLICATE_0ef4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_c988_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l725_l721_l718_l712_l728_DUPLICATE_0ef4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l721_c7_8875_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l725_l721_l718_l712_l728_DUPLICATE_0ef4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_3045_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l725_l721_l718_l712_l728_DUPLICATE_0ef4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l725_l721_l718_l712_l728_DUPLICATE_0ef4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l725_l721_l718_l736_l728_DUPLICATE_3ccb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l725_l721_l718_l736_l728_DUPLICATE_3ccb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l725_l721_l718_l736_l728_DUPLICATE_3ccb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l725_l721_l718_l736_l728_DUPLICATE_3ccb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l725_l721_l718_l736_l728_DUPLICATE_3ccb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l725_l721_l718_l712_l736_DUPLICATE_b8e4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l725_l721_l718_l712_l736_DUPLICATE_b8e4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l725_l721_l718_l712_l736_DUPLICATE_b8e4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l725_l721_l718_l712_l736_DUPLICATE_b8e4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l725_l721_l718_l712_l736_DUPLICATE_b8e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l725_l721_l718_l712_l736_DUPLICATE_8a35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l725_l721_l718_l712_l736_DUPLICATE_8a35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l725_l721_l718_l712_l736_DUPLICATE_8a35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l725_l721_l718_l712_l736_DUPLICATE_8a35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l725_l721_l718_l712_l736_DUPLICATE_8a35_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l725_l718_l728_l721_DUPLICATE_592e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l725_l718_l728_l721_DUPLICATE_592e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l725_l718_l728_l721_DUPLICATE_592e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l725_l718_l728_l721_DUPLICATE_592e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l725_c7_3045_return_output;
     -- t8_MUX[uxn_opcodes_h_l721_c7_8875] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l721_c7_8875_cond <= VAR_t8_MUX_uxn_opcodes_h_l721_c7_8875_cond;
     t8_MUX_uxn_opcodes_h_l721_c7_8875_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l721_c7_8875_iftrue;
     t8_MUX_uxn_opcodes_h_l721_c7_8875_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l721_c7_8875_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l721_c7_8875_return_output := t8_MUX_uxn_opcodes_h_l721_c7_8875_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l736_c7_49e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l734_c30_add8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l734_c30_add8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l734_c30_add8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l734_c30_add8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l734_c30_add8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l734_c30_add8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l734_c30_add8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l736_c7_49e8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_return_output;

     -- n8_MUX[uxn_opcodes_h_l728_c7_5acf] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l728_c7_5acf_cond <= VAR_n8_MUX_uxn_opcodes_h_l728_c7_5acf_cond;
     n8_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue;
     n8_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l728_c7_5acf_return_output := n8_MUX_uxn_opcodes_h_l728_c7_5acf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l736_c7_49e8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l728_c7_5acf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l732_c32_3061] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l732_c32_3061_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l732_c32_3061_left;
     BIN_OP_GT_uxn_opcodes_h_l732_c32_3061_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l732_c32_3061_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l732_c32_3061_return_output := BIN_OP_GT_uxn_opcodes_h_l732_c32_3061_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l712_c1_50da] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l725_c7_3045] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l732_c32_fad5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l732_c32_3061_return_output;
     VAR_MUX_uxn_opcodes_h_l734_c15_6899_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l734_c30_add8_return_output)),16);
     VAR_printf_uxn_opcodes_h_l713_c3_eff9_uxn_opcodes_h_l713_c3_eff9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_50da_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l725_c7_3045_iffalse := VAR_n8_MUX_uxn_opcodes_h_l728_c7_5acf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_49e8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_49e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_49e8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c7_5acf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_3045_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l718_c7_c988_iffalse := VAR_t8_MUX_uxn_opcodes_h_l721_c7_8875_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l725_c7_3045] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l728_c7_5acf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l721_c7_8875] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_return_output;

     -- MUX[uxn_opcodes_h_l734_c15_6899] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l734_c15_6899_cond <= VAR_MUX_uxn_opcodes_h_l734_c15_6899_cond;
     MUX_uxn_opcodes_h_l734_c15_6899_iftrue <= VAR_MUX_uxn_opcodes_h_l734_c15_6899_iftrue;
     MUX_uxn_opcodes_h_l734_c15_6899_iffalse <= VAR_MUX_uxn_opcodes_h_l734_c15_6899_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l734_c15_6899_return_output := MUX_uxn_opcodes_h_l734_c15_6899_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l728_c7_5acf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_return_output;

     -- n8_MUX[uxn_opcodes_h_l725_c7_3045] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l725_c7_3045_cond <= VAR_n8_MUX_uxn_opcodes_h_l725_c7_3045_cond;
     n8_MUX_uxn_opcodes_h_l725_c7_3045_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l725_c7_3045_iftrue;
     n8_MUX_uxn_opcodes_h_l725_c7_3045_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l725_c7_3045_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l725_c7_3045_return_output := n8_MUX_uxn_opcodes_h_l725_c7_3045_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l728_c7_5acf] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_return_output;

     -- printf_uxn_opcodes_h_l713_c3_eff9[uxn_opcodes_h_l713_c3_eff9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l713_c3_eff9_uxn_opcodes_h_l713_c3_eff9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l713_c3_eff9_uxn_opcodes_h_l713_c3_eff9_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l718_c7_c988] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l718_c7_c988_cond <= VAR_t8_MUX_uxn_opcodes_h_l718_c7_c988_cond;
     t8_MUX_uxn_opcodes_h_l718_c7_c988_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l718_c7_c988_iftrue;
     t8_MUX_uxn_opcodes_h_l718_c7_c988_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l718_c7_c988_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l718_c7_c988_return_output := t8_MUX_uxn_opcodes_h_l718_c7_c988_return_output;

     -- MUX[uxn_opcodes_h_l732_c32_fad5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l732_c32_fad5_cond <= VAR_MUX_uxn_opcodes_h_l732_c32_fad5_cond;
     MUX_uxn_opcodes_h_l732_c32_fad5_iftrue <= VAR_MUX_uxn_opcodes_h_l732_c32_fad5_iftrue;
     MUX_uxn_opcodes_h_l732_c32_fad5_iffalse <= VAR_MUX_uxn_opcodes_h_l732_c32_fad5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l732_c32_fad5_return_output := MUX_uxn_opcodes_h_l732_c32_fad5_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue := VAR_MUX_uxn_opcodes_h_l732_c32_fad5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue := VAR_MUX_uxn_opcodes_h_l734_c15_6899_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l721_c7_8875_iffalse := VAR_n8_MUX_uxn_opcodes_h_l725_c7_3045_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_5acf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_5acf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c7_5acf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l725_c7_3045_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_8875_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l718_c7_c988_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l721_c7_8875] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_return_output;

     -- t8_MUX[uxn_opcodes_h_l712_c2_aba4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l712_c2_aba4_cond <= VAR_t8_MUX_uxn_opcodes_h_l712_c2_aba4_cond;
     t8_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue;
     t8_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l712_c2_aba4_return_output := t8_MUX_uxn_opcodes_h_l712_c2_aba4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l725_c7_3045] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l725_c7_3045] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l728_c7_5acf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l725_c7_3045] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l718_c7_c988] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l728_c7_5acf] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_cond;
     result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_iftrue;
     result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_return_output := result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_return_output;

     -- n8_MUX[uxn_opcodes_h_l721_c7_8875] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l721_c7_8875_cond <= VAR_n8_MUX_uxn_opcodes_h_l721_c7_8875_cond;
     n8_MUX_uxn_opcodes_h_l721_c7_8875_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l721_c7_8875_iftrue;
     n8_MUX_uxn_opcodes_h_l721_c7_8875_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l721_c7_8875_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l721_c7_8875_return_output := n8_MUX_uxn_opcodes_h_l721_c7_8875_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l718_c7_c988_iffalse := VAR_n8_MUX_uxn_opcodes_h_l721_c7_8875_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_3045_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_3045_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_3045_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l721_c7_8875_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_3045_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l728_c7_5acf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_5acf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c7_c988_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l712_c2_aba4_return_output;
     -- n8_MUX[uxn_opcodes_h_l718_c7_c988] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l718_c7_c988_cond <= VAR_n8_MUX_uxn_opcodes_h_l718_c7_c988_cond;
     n8_MUX_uxn_opcodes_h_l718_c7_c988_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l718_c7_c988_iftrue;
     n8_MUX_uxn_opcodes_h_l718_c7_c988_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l718_c7_c988_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l718_c7_c988_return_output := n8_MUX_uxn_opcodes_h_l718_c7_c988_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l725_c7_3045] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l721_c7_8875] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l718_c7_c988] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l725_c7_3045] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l725_c7_3045_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_3045_cond;
     result_pc_MUX_uxn_opcodes_h_l725_c7_3045_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_3045_iftrue;
     result_pc_MUX_uxn_opcodes_h_l725_c7_3045_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_3045_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_3045_return_output := result_pc_MUX_uxn_opcodes_h_l725_c7_3045_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l721_c7_8875] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l712_c2_aba4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l721_c7_8875] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l718_c7_c988_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_8875_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c7_8875_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c7_8875_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c7_c988_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l721_c7_8875_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_3045_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_3045_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l712_c2_aba4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l718_c7_c988] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l721_c7_8875] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l718_c7_c988] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_return_output;

     -- n8_MUX[uxn_opcodes_h_l712_c2_aba4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l712_c2_aba4_cond <= VAR_n8_MUX_uxn_opcodes_h_l712_c2_aba4_cond;
     n8_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue;
     n8_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l712_c2_aba4_return_output := n8_MUX_uxn_opcodes_h_l712_c2_aba4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l718_c7_c988] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l721_c7_8875] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l721_c7_8875_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l721_c7_8875_cond;
     result_pc_MUX_uxn_opcodes_h_l721_c7_8875_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l721_c7_8875_iftrue;
     result_pc_MUX_uxn_opcodes_h_l721_c7_8875_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l721_c7_8875_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l721_c7_8875_return_output := result_pc_MUX_uxn_opcodes_h_l721_c7_8875_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l712_c2_aba4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_c988_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_c988_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c7_c988_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_c988_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l721_c7_8875_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c7_8875_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l718_c7_c988] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l712_c2_aba4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l712_c2_aba4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l718_c7_c988] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l718_c7_c988_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_c988_cond;
     result_pc_MUX_uxn_opcodes_h_l718_c7_c988_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_c988_iftrue;
     result_pc_MUX_uxn_opcodes_h_l718_c7_c988_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_c988_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_c988_return_output := result_pc_MUX_uxn_opcodes_h_l718_c7_c988_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l712_c2_aba4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_return_output;

     -- Submodule level 7
     VAR_result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_c988_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_c988_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l712_c2_aba4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l712_c2_aba4] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_cond;
     result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_iftrue;
     result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_return_output := result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_cc54_uxn_opcodes_h_l742_l708_DUPLICATE_d77f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc54_uxn_opcodes_h_l742_l708_DUPLICATE_d77f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_cc54(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_aba4_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_aba4_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l712_c2_aba4_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l712_c2_aba4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_aba4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_aba4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_aba4_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc54_uxn_opcodes_h_l742_l708_DUPLICATE_d77f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc54_uxn_opcodes_h_l742_l708_DUPLICATE_d77f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
