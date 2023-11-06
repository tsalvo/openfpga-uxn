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
-- Submodules: 45
entity jcn_0CLK_85d5529e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn_0CLK_85d5529e;
architecture arch of jcn_0CLK_85d5529e is
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
-- BIN_OP_EQ[uxn_opcodes_h_l644_c6_5ab6]
signal BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l644_c1_8890]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l644_c2_ccc4]
signal t8_MUX_uxn_opcodes_h_l644_c2_ccc4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l644_c2_ccc4]
signal n8_MUX_uxn_opcodes_h_l644_c2_ccc4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l644_c2_ccc4]
signal result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l644_c2_ccc4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l644_c2_ccc4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l644_c2_ccc4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l644_c2_ccc4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l644_c2_ccc4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output : signed(3 downto 0);

-- printf_uxn_opcodes_h_l645_c3_0c01[uxn_opcodes_h_l645_c3_0c01]
signal printf_uxn_opcodes_h_l645_c3_0c01_uxn_opcodes_h_l645_c3_0c01_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l649_c11_de24]
signal BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l649_c7_46e3]
signal t8_MUX_uxn_opcodes_h_l649_c7_46e3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l649_c7_46e3_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l649_c7_46e3]
signal n8_MUX_uxn_opcodes_h_l649_c7_46e3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l649_c7_46e3_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l649_c7_46e3]
signal result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l649_c7_46e3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l649_c7_46e3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l649_c7_46e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l649_c7_46e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l649_c7_46e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l652_c11_e962]
signal BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l652_c7_3c9c]
signal t8_MUX_uxn_opcodes_h_l652_c7_3c9c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l652_c7_3c9c]
signal n8_MUX_uxn_opcodes_h_l652_c7_3c9c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l652_c7_3c9c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l652_c7_3c9c]
signal result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l652_c7_3c9c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l652_c7_3c9c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l652_c7_3c9c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l655_c11_4e13]
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l655_c7_ce76]
signal n8_MUX_uxn_opcodes_h_l655_c7_ce76_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l655_c7_ce76_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l655_c7_ce76]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l655_c7_ce76]
signal result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l655_c7_ce76]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l655_c7_ce76]
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l655_c7_ce76]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l658_c30_b926]
signal sp_relative_shift_uxn_opcodes_h_l658_c30_b926_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l658_c30_b926_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l658_c30_b926_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l658_c30_b926_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l660_c22_7a71]
signal BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a71_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a71_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a71_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l660_c37_d859]
signal BIN_OP_PLUS_uxn_opcodes_h_l660_c37_d859_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l660_c37_d859_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l660_c37_d859_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l660_c22_2049]
signal MUX_uxn_opcodes_h_l660_c22_2049_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l660_c22_2049_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l660_c22_2049_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l660_c22_2049_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l662_c11_1096]
signal BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l662_c7_7b40]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l662_c7_7b40]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l662_c7_7b40]
signal result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_660c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6
BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_left,
BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_right,
BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_return_output);

-- t8_MUX_uxn_opcodes_h_l644_c2_ccc4
t8_MUX_uxn_opcodes_h_l644_c2_ccc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l644_c2_ccc4_cond,
t8_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue,
t8_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse,
t8_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output);

-- n8_MUX_uxn_opcodes_h_l644_c2_ccc4
n8_MUX_uxn_opcodes_h_l644_c2_ccc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l644_c2_ccc4_cond,
n8_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue,
n8_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse,
n8_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4
result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_cond,
result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4
result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output);

-- printf_uxn_opcodes_h_l645_c3_0c01_uxn_opcodes_h_l645_c3_0c01
printf_uxn_opcodes_h_l645_c3_0c01_uxn_opcodes_h_l645_c3_0c01 : entity work.printf_uxn_opcodes_h_l645_c3_0c01_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l645_c3_0c01_uxn_opcodes_h_l645_c3_0c01_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24
BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_left,
BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_right,
BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_return_output);

-- t8_MUX_uxn_opcodes_h_l649_c7_46e3
t8_MUX_uxn_opcodes_h_l649_c7_46e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l649_c7_46e3_cond,
t8_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue,
t8_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse,
t8_MUX_uxn_opcodes_h_l649_c7_46e3_return_output);

-- n8_MUX_uxn_opcodes_h_l649_c7_46e3
n8_MUX_uxn_opcodes_h_l649_c7_46e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l649_c7_46e3_cond,
n8_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue,
n8_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse,
n8_MUX_uxn_opcodes_h_l649_c7_46e3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3
result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_cond,
result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3
result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3
result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3
result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962
BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_left,
BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_right,
BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_return_output);

-- t8_MUX_uxn_opcodes_h_l652_c7_3c9c
t8_MUX_uxn_opcodes_h_l652_c7_3c9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l652_c7_3c9c_cond,
t8_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue,
t8_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse,
t8_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output);

-- n8_MUX_uxn_opcodes_h_l652_c7_3c9c
n8_MUX_uxn_opcodes_h_l652_c7_3c9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l652_c7_3c9c_cond,
n8_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue,
n8_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse,
n8_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c
result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c
result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_cond,
result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c
result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c
result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c
result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13
BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_left,
BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_right,
BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_return_output);

-- n8_MUX_uxn_opcodes_h_l655_c7_ce76
n8_MUX_uxn_opcodes_h_l655_c7_ce76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l655_c7_ce76_cond,
n8_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue,
n8_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse,
n8_MUX_uxn_opcodes_h_l655_c7_ce76_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76
result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76
result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_cond,
result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_return_output);

-- sp_relative_shift_uxn_opcodes_h_l658_c30_b926
sp_relative_shift_uxn_opcodes_h_l658_c30_b926 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l658_c30_b926_ins,
sp_relative_shift_uxn_opcodes_h_l658_c30_b926_x,
sp_relative_shift_uxn_opcodes_h_l658_c30_b926_y,
sp_relative_shift_uxn_opcodes_h_l658_c30_b926_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a71
BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a71 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a71_left,
BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a71_right,
BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a71_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l660_c37_d859
BIN_OP_PLUS_uxn_opcodes_h_l660_c37_d859 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l660_c37_d859_left,
BIN_OP_PLUS_uxn_opcodes_h_l660_c37_d859_right,
BIN_OP_PLUS_uxn_opcodes_h_l660_c37_d859_return_output);

-- MUX_uxn_opcodes_h_l660_c22_2049
MUX_uxn_opcodes_h_l660_c22_2049 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l660_c22_2049_cond,
MUX_uxn_opcodes_h_l660_c22_2049_iftrue,
MUX_uxn_opcodes_h_l660_c22_2049_iffalse,
MUX_uxn_opcodes_h_l660_c22_2049_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096
BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096_left,
BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096_right,
BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40
result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40
result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40
result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_return_output,
 t8_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output,
 n8_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_return_output,
 t8_MUX_uxn_opcodes_h_l649_c7_46e3_return_output,
 n8_MUX_uxn_opcodes_h_l649_c7_46e3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_return_output,
 t8_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output,
 n8_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_return_output,
 n8_MUX_uxn_opcodes_h_l655_c7_ce76_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_return_output,
 sp_relative_shift_uxn_opcodes_h_l658_c30_b926_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a71_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l660_c37_d859_return_output,
 MUX_uxn_opcodes_h_l660_c22_2049_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l649_c7_46e3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l644_c2_ccc4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l649_c7_46e3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l644_c2_ccc4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l646_c3_e262 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l645_c3_0c01_uxn_opcodes_h_l645_c3_0c01_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l649_c7_46e3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l649_c7_46e3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l650_c3_b4d0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l649_c7_46e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l652_c7_3c9c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l655_c7_ce76_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l652_c7_3c9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l655_c7_ce76_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_b926_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_b926_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_b926_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_b926_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l660_c22_2049_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l660_c22_2049_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l660_c22_2049_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a71_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a71_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_d859_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l660_c42_7af8_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_d859_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_d859_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l660_c22_2049_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l655_l649_l652_l644_DUPLICATE_a3b4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l649_l662_l652_l644_DUPLICATE_94aa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l649_l662_l652_l644_DUPLICATE_fb36_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l655_l649_l652_l644_DUPLICATE_ebde_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l649_l662_l652_DUPLICATE_759b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l640_l668_DUPLICATE_c20e_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a71_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_b926_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l646_c3_e262 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l646_c3_e262;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_b926_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l650_c3_b4d0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l650_c3_b4d0;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_b926_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_d859_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l660_c22_2049_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a71_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l649_c11_de24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_left;
     BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_return_output := BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l655_c11_4e13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_left;
     BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_return_output := BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l660_c42_7af8] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l660_c42_7af8_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l660_c22_7a71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a71_left;
     BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a71_return_output := BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a71_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l655_l649_l652_l644_DUPLICATE_a3b4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l655_l649_l652_l644_DUPLICATE_a3b4_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l652_c11_e962] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_left;
     BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_return_output := BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l649_l662_l652_DUPLICATE_759b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l649_l662_l652_DUPLICATE_759b_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l649_l662_l652_l644_DUPLICATE_94aa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l649_l662_l652_l644_DUPLICATE_94aa_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l644_c6_5ab6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_left;
     BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_return_output := BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l649_l662_l652_l644_DUPLICATE_fb36 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l649_l662_l652_l644_DUPLICATE_fb36_return_output := result.is_sp_shift;

     -- sp_relative_shift[uxn_opcodes_h_l658_c30_b926] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l658_c30_b926_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_b926_ins;
     sp_relative_shift_uxn_opcodes_h_l658_c30_b926_x <= VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_b926_x;
     sp_relative_shift_uxn_opcodes_h_l658_c30_b926_y <= VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_b926_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_b926_return_output := sp_relative_shift_uxn_opcodes_h_l658_c30_b926_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l649_c7_46e3] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l649_c7_46e3_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l655_l649_l652_l644_DUPLICATE_ebde LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l655_l649_l652_l644_DUPLICATE_ebde_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l662_c11_1096] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096_left;
     BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096_return_output := BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l644_c2_ccc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l644_c2_ccc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_5ab6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l649_c7_46e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l649_c7_46e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_de24_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l652_c7_3c9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l652_c7_3c9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_e962_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l655_c7_ce76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_4e13_return_output;
     VAR_MUX_uxn_opcodes_h_l660_c22_2049_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_1096_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_d859_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l660_c42_7af8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l655_l649_l652_l644_DUPLICATE_ebde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l655_l649_l652_l644_DUPLICATE_ebde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l655_l649_l652_l644_DUPLICATE_ebde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l655_l649_l652_l644_DUPLICATE_ebde_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l655_l649_l652_l644_DUPLICATE_a3b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l655_l649_l652_l644_DUPLICATE_a3b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l655_l649_l652_l644_DUPLICATE_a3b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l655_l649_l652_l644_DUPLICATE_a3b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l649_l662_l652_DUPLICATE_759b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l649_l662_l652_DUPLICATE_759b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l649_l662_l652_DUPLICATE_759b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l649_l662_l652_DUPLICATE_759b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l649_l662_l652_l644_DUPLICATE_94aa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l649_l662_l652_l644_DUPLICATE_94aa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l649_l662_l652_l644_DUPLICATE_94aa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l649_l662_l652_l644_DUPLICATE_94aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l649_l662_l652_l644_DUPLICATE_fb36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l649_l662_l652_l644_DUPLICATE_fb36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l649_l662_l652_l644_DUPLICATE_fb36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l649_l662_l652_l644_DUPLICATE_fb36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l649_c7_46e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_b926_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l649_c7_46e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l662_c7_7b40] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l662_c7_7b40] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l644_c1_8890] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l660_c37_d859] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l660_c37_d859_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_d859_left;
     BIN_OP_PLUS_uxn_opcodes_h_l660_c37_d859_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_d859_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_d859_return_output := BIN_OP_PLUS_uxn_opcodes_h_l660_c37_d859_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l662_c7_7b40] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l655_c7_ce76] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_return_output;

     -- n8_MUX[uxn_opcodes_h_l655_c7_ce76] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l655_c7_ce76_cond <= VAR_n8_MUX_uxn_opcodes_h_l655_c7_ce76_cond;
     n8_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue;
     n8_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l655_c7_ce76_return_output := n8_MUX_uxn_opcodes_h_l655_c7_ce76_return_output;

     -- t8_MUX[uxn_opcodes_h_l652_c7_3c9c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l652_c7_3c9c_cond <= VAR_t8_MUX_uxn_opcodes_h_l652_c7_3c9c_cond;
     t8_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue;
     t8_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output := t8_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l660_c22_2049_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_d859_return_output)),16);
     VAR_printf_uxn_opcodes_h_l645_c3_0c01_uxn_opcodes_h_l645_c3_0c01_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_8890_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l655_c7_ce76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_7b40_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_7b40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_7b40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_ce76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_46e3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output;
     -- n8_MUX[uxn_opcodes_h_l652_c7_3c9c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l652_c7_3c9c_cond <= VAR_n8_MUX_uxn_opcodes_h_l652_c7_3c9c_cond;
     n8_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue;
     n8_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output := n8_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l655_c7_ce76] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l655_c7_ce76] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l655_c7_ce76] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_return_output;

     -- MUX[uxn_opcodes_h_l660_c22_2049] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l660_c22_2049_cond <= VAR_MUX_uxn_opcodes_h_l660_c22_2049_cond;
     MUX_uxn_opcodes_h_l660_c22_2049_iftrue <= VAR_MUX_uxn_opcodes_h_l660_c22_2049_iftrue;
     MUX_uxn_opcodes_h_l660_c22_2049_iffalse <= VAR_MUX_uxn_opcodes_h_l660_c22_2049_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l660_c22_2049_return_output := MUX_uxn_opcodes_h_l660_c22_2049_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l644_c2_ccc4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l652_c7_3c9c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output;

     -- printf_uxn_opcodes_h_l645_c3_0c01[uxn_opcodes_h_l645_c3_0c01] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l645_c3_0c01_uxn_opcodes_h_l645_c3_0c01_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l645_c3_0c01_uxn_opcodes_h_l645_c3_0c01_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l649_c7_46e3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l649_c7_46e3_cond <= VAR_t8_MUX_uxn_opcodes_h_l649_c7_46e3_cond;
     t8_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue;
     t8_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l649_c7_46e3_return_output := t8_MUX_uxn_opcodes_h_l649_c7_46e3_return_output;

     -- Submodule level 3
     VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue := VAR_MUX_uxn_opcodes_h_l660_c22_2049_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_ce76_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_ce76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_ce76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l649_c7_46e3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l652_c7_3c9c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l652_c7_3c9c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l649_c7_46e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l655_c7_ce76] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_cond;
     result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_return_output := result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_return_output;

     -- n8_MUX[uxn_opcodes_h_l649_c7_46e3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l649_c7_46e3_cond <= VAR_n8_MUX_uxn_opcodes_h_l649_c7_46e3_cond;
     n8_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue;
     n8_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l649_c7_46e3_return_output := n8_MUX_uxn_opcodes_h_l649_c7_46e3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l652_c7_3c9c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output;

     -- t8_MUX[uxn_opcodes_h_l644_c2_ccc4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l644_c2_ccc4_cond <= VAR_t8_MUX_uxn_opcodes_h_l644_c2_ccc4_cond;
     t8_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue;
     t8_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output := t8_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l649_c7_46e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_46e3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_ce76_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l652_c7_3c9c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output := result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l644_c2_ccc4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l649_c7_46e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l649_c7_46e3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_return_output;

     -- n8_MUX[uxn_opcodes_h_l644_c2_ccc4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l644_c2_ccc4_cond <= VAR_n8_MUX_uxn_opcodes_h_l644_c2_ccc4_cond;
     n8_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue;
     n8_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output := n8_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l649_c7_46e3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_46e3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_46e3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_46e3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_3c9c_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l649_c7_46e3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_return_output := result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l644_c2_ccc4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l644_c2_ccc4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l644_c2_ccc4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_46e3_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l644_c2_ccc4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output := result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l640_l668_DUPLICATE_c20e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l640_l668_DUPLICATE_c20e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_660c(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_ccc4_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l640_l668_DUPLICATE_c20e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l640_l668_DUPLICATE_c20e_return_output;
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
