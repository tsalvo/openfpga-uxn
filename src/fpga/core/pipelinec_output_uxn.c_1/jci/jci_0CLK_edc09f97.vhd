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
-- Submodules: 57
entity jci_0CLK_edc09f97 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_edc09f97;
architecture arch of jci_0CLK_edc09f97 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l72_c6_72c4]
signal BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l72_c1_6dd9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l72_c2_726d]
signal t8_MUX_uxn_opcodes_h_l72_c2_726d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l72_c2_726d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l72_c2_726d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l72_c2_726d_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l72_c2_726d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l72_c2_726d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l72_c2_726d]
signal result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l72_c2_726d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l72_c2_726d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l72_c2_726d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l72_c2_726d]
signal tmp16_MUX_uxn_opcodes_h_l72_c2_726d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l72_c2_726d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l72_c2_726d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l72_c2_726d_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l73_c3_e67f[uxn_opcodes_h_l73_c3_e67f]
signal printf_uxn_opcodes_h_l73_c3_e67f_uxn_opcodes_h_l73_c3_e67f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l77_c11_db6a]
signal BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l77_c7_4c4b]
signal t8_MUX_uxn_opcodes_h_l77_c7_4c4b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l77_c7_4c4b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l77_c7_4c4b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l77_c7_4c4b]
signal result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l77_c7_4c4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l77_c7_4c4b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l77_c7_4c4b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l77_c7_4c4b]
signal tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l80_c11_dd39]
signal BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l80_c7_1b6f]
signal t8_MUX_uxn_opcodes_h_l80_c7_1b6f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l80_c7_1b6f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l80_c7_1b6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l80_c7_1b6f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l80_c7_1b6f]
signal result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l80_c7_1b6f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l80_c7_1b6f]
signal tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l86_c11_954b]
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l86_c7_1c64]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l86_c7_1c64]
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l86_c7_1c64]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l86_c7_1c64]
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l86_c7_1c64]
signal tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_8440]
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_8440_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_8440_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_8440_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_fc5e]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_4f22]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_4f22]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l90_c7_4f22]
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_4f22]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l92_c3_a73a]
signal CONST_SL_8_uxn_opcodes_h_l92_c3_a73a_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l92_c3_a73a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l94_c11_8357]
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l94_c7_c0ab]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l94_c7_c0ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l94_c7_c0ab]
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l94_c7_c0ab]
signal tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l95_c3_6a29]
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_6a29_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_6a29_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_6a29_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l97_c22_d953]
signal BIN_OP_EQ_uxn_opcodes_h_l97_c22_d953_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c22_d953_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c22_d953_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c32_30a8]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c32_30a8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c32_30a8_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c32_30a8_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_837e]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_837e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_837e_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_837e_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_e3bc]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e3bc_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e3bc_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e3bc_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l97_c22_89a0]
signal MUX_uxn_opcodes_h_l97_c22_89a0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l97_c22_89a0_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l97_c22_89a0_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l97_c22_89a0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c11_8d5f]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d5f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d5f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d5f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l99_c7_4992]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l99_c7_4992]
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a132( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4
BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_left,
BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_right,
BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_return_output);

-- t8_MUX_uxn_opcodes_h_l72_c2_726d
t8_MUX_uxn_opcodes_h_l72_c2_726d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l72_c2_726d_cond,
t8_MUX_uxn_opcodes_h_l72_c2_726d_iftrue,
t8_MUX_uxn_opcodes_h_l72_c2_726d_iffalse,
t8_MUX_uxn_opcodes_h_l72_c2_726d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d
result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_cond,
result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l72_c2_726d
tmp16_MUX_uxn_opcodes_h_l72_c2_726d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l72_c2_726d_cond,
tmp16_MUX_uxn_opcodes_h_l72_c2_726d_iftrue,
tmp16_MUX_uxn_opcodes_h_l72_c2_726d_iffalse,
tmp16_MUX_uxn_opcodes_h_l72_c2_726d_return_output);

-- printf_uxn_opcodes_h_l73_c3_e67f_uxn_opcodes_h_l73_c3_e67f
printf_uxn_opcodes_h_l73_c3_e67f_uxn_opcodes_h_l73_c3_e67f : entity work.printf_uxn_opcodes_h_l73_c3_e67f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l73_c3_e67f_uxn_opcodes_h_l73_c3_e67f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a
BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_left,
BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_right,
BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_return_output);

-- t8_MUX_uxn_opcodes_h_l77_c7_4c4b
t8_MUX_uxn_opcodes_h_l77_c7_4c4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l77_c7_4c4b_cond,
t8_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue,
t8_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse,
t8_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b
result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_cond,
result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b
tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_cond,
tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue,
tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse,
tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39
BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_left,
BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_right,
BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_return_output);

-- t8_MUX_uxn_opcodes_h_l80_c7_1b6f
t8_MUX_uxn_opcodes_h_l80_c7_1b6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l80_c7_1b6f_cond,
t8_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue,
t8_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse,
t8_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f
result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_cond,
result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f
result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f
tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_cond,
tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue,
tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse,
tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b
BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_left,
BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_right,
BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64
result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64
result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_cond,
result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_return_output);

-- tmp16_MUX_uxn_opcodes_h_l86_c7_1c64
tmp16_MUX_uxn_opcodes_h_l86_c7_1c64 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_cond,
tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue,
tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse,
tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l88_c22_8440
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_8440 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_8440_left,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_8440_right,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_8440_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e
BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22
result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_cond,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_4f22
tmp16_MUX_uxn_opcodes_h_l90_c7_4f22 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_return_output);

-- CONST_SL_8_uxn_opcodes_h_l92_c3_a73a
CONST_SL_8_uxn_opcodes_h_l92_c3_a73a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l92_c3_a73a_x,
CONST_SL_8_uxn_opcodes_h_l92_c3_a73a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357
BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357_left,
BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357_right,
BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab
result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_cond,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output);

-- tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab
tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_cond,
tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue,
tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse,
tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l95_c3_6a29
BIN_OP_OR_uxn_opcodes_h_l95_c3_6a29 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l95_c3_6a29_left,
BIN_OP_OR_uxn_opcodes_h_l95_c3_6a29_right,
BIN_OP_OR_uxn_opcodes_h_l95_c3_6a29_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l97_c22_d953
BIN_OP_EQ_uxn_opcodes_h_l97_c22_d953 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l97_c22_d953_left,
BIN_OP_EQ_uxn_opcodes_h_l97_c22_d953_right,
BIN_OP_EQ_uxn_opcodes_h_l97_c22_d953_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c32_30a8
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_30a8 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_30a8_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_30a8_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_30a8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c42_837e
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_837e : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_837e_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_837e_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_837e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e3bc
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e3bc : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e3bc_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e3bc_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e3bc_return_output);

-- MUX_uxn_opcodes_h_l97_c22_89a0
MUX_uxn_opcodes_h_l97_c22_89a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l97_c22_89a0_cond,
MUX_uxn_opcodes_h_l97_c22_89a0_iftrue,
MUX_uxn_opcodes_h_l97_c22_89a0_iffalse,
MUX_uxn_opcodes_h_l97_c22_89a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d5f
BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d5f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d5f_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d5f_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d5f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_return_output);



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
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_return_output,
 t8_MUX_uxn_opcodes_h_l72_c2_726d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_return_output,
 tmp16_MUX_uxn_opcodes_h_l72_c2_726d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_return_output,
 t8_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output,
 tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_return_output,
 t8_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output,
 tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_return_output,
 tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l88_c22_8440_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_return_output,
 CONST_SL_8_uxn_opcodes_h_l92_c3_a73a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output,
 tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output,
 BIN_OP_OR_uxn_opcodes_h_l95_c3_6a29_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l97_c22_d953_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c32_30a8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c42_837e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e3bc_return_output,
 MUX_uxn_opcodes_h_l97_c22_89a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d5f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l72_c2_726d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l72_c2_726d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l72_c2_726d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l72_c2_726d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_9eec : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_726d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_726d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_726d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_726d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l73_c3_e67f_uxn_opcodes_h_l73_c3_e67f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_4c4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l78_c3_14cf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l77_c7_4c4b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l80_c7_1b6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_7be9 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l88_c3_7c6b : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_8440_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_8440_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_8440_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_a73a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_a73a_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_6a29_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_6a29_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_6a29_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_89a0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_89a0_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_89a0_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_d953_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_d953_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_d953_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_30a8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_30a8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_30a8_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_837e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_837e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_837e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e3bc_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e3bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e3bc_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_89a0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d5f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d5f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_1901_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_dd3d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l72_l77_l90_l94_DUPLICATE_1d21_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l72_l77_l80_DUPLICATE_1178_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_04af_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l91_l95_DUPLICATE_6982_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a132_uxn_opcodes_h_l104_l67_DUPLICATE_b0f1_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_d953_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l78_c3_14cf := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l78_c3_14cf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_7be9 := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_7be9;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_30a8_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d5f_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_9eec := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_9eec;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_8440_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e3bc_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_8440_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_30a8_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_837e_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d5f_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_d953_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l72_c2_726d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_6a29_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_726d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_fc5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l86_c11_954b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_left;
     BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_return_output := BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l99_c11_8d5f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d5f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d5f_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d5f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d5f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d5f_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d5f_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l77_c7_4c4b] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l77_c7_4c4b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l80_c11_dd39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_left;
     BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_return_output := BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_dd3d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_dd3d_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l97_c22_d953] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l97_c22_d953_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_d953_left;
     BIN_OP_EQ_uxn_opcodes_h_l97_c22_d953_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_d953_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_d953_return_output := BIN_OP_EQ_uxn_opcodes_h_l97_c22_d953_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l77_c11_db6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l91_l95_DUPLICATE_6982 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l91_l95_DUPLICATE_6982_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l72_l77_l80_DUPLICATE_1178 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l72_l77_l80_DUPLICATE_1178_return_output := result.sp_relative_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_8440] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_8440_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_8440_left;
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_8440_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_8440_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_8440_return_output := BIN_OP_PLUS_uxn_opcodes_h_l88_c22_8440_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_1901 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_1901_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l72_l77_l90_l94_DUPLICATE_1d21 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l72_l77_l90_l94_DUPLICATE_1d21_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l94_c11_8357] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357_left;
     BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357_return_output := BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l72_c6_72c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c32_30a8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c32_30a8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_30a8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c32_30a8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_30a8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_30a8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c32_30a8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_04af LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_04af_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l72_c2_726d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_726d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_72c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_4c4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_db6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l80_c7_1b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_dd39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_954b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_fc5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8357_return_output;
     VAR_MUX_uxn_opcodes_h_l97_c22_89a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_d953_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d5f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d5f_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l88_c3_7c6b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_8440_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l97_c22_89a0_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_30a8_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_6a29_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l91_l95_DUPLICATE_6982_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_a73a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l91_l95_DUPLICATE_6982_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l72_l77_l80_DUPLICATE_1178_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l72_l77_l80_DUPLICATE_1178_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l72_l77_l80_DUPLICATE_1178_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l72_l77_l90_l94_DUPLICATE_1d21_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l72_l77_l90_l94_DUPLICATE_1d21_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l72_l77_l90_l94_DUPLICATE_1d21_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l72_l77_l90_l94_DUPLICATE_1d21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_04af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_04af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_04af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_04af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_04af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_04af_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_1901_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_1901_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_1901_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_1901_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_1901_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_1901_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_dd3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_dd3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_dd3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l77_c7_4c4b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue := VAR_result_u16_value_uxn_opcodes_h_l88_c3_7c6b;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l99_c7_4992] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l77_c7_4c4b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l72_c1_6dd9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l92_c3_a73a] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l92_c3_a73a_x <= VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_a73a_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_a73a_return_output := CONST_SL_8_uxn_opcodes_h_l92_c3_a73a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l99_c7_4992] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l95_c3_6a29] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l95_c3_6a29_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_6a29_left;
     BIN_OP_OR_uxn_opcodes_h_l95_c3_6a29_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_6a29_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_6a29_return_output := BIN_OP_OR_uxn_opcodes_h_l95_c3_6a29_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l80_c7_1b6f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l86_c7_1c64] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_return_output;

     -- t8_MUX[uxn_opcodes_h_l80_c7_1b6f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l80_c7_1b6f_cond <= VAR_t8_MUX_uxn_opcodes_h_l80_c7_1b6f_cond;
     t8_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue;
     t8_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output := t8_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_837e_right := VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_6a29_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_6a29_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_a73a_return_output;
     VAR_printf_uxn_opcodes_h_l73_c3_e67f_uxn_opcodes_h_l73_c3_e67f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_6dd9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_4992_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_4992_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_1c64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l94_c7_c0ab] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l94_c7_c0ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output;

     -- printf_uxn_opcodes_h_l73_c3_e67f[uxn_opcodes_h_l73_c3_e67f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l73_c3_e67f_uxn_opcodes_h_l73_c3_e67f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l73_c3_e67f_uxn_opcodes_h_l73_c3_e67f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l77_c7_4c4b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l80_c7_1b6f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l72_c2_726d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_837e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_837e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_837e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_837e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_837e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_837e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c42_837e_return_output;

     -- t8_MUX[uxn_opcodes_h_l77_c7_4c4b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l77_c7_4c4b_cond <= VAR_t8_MUX_uxn_opcodes_h_l77_c7_4c4b_cond;
     t8_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue;
     t8_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output := t8_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l94_c7_c0ab] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_cond;
     tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue;
     tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output := tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e3bc_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_837e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l72_c2_726d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l90_c7_4f22] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l72_c2_726d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_4f22] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_4f22] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_e3bc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e3bc_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e3bc_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e3bc_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e3bc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e3bc_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e3bc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l77_c7_4c4b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output;

     -- t8_MUX[uxn_opcodes_h_l72_c2_726d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l72_c2_726d_cond <= VAR_t8_MUX_uxn_opcodes_h_l72_c2_726d_cond;
     t8_MUX_uxn_opcodes_h_l72_c2_726d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l72_c2_726d_iftrue;
     t8_MUX_uxn_opcodes_h_l72_c2_726d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l72_c2_726d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l72_c2_726d_return_output := t8_MUX_uxn_opcodes_h_l72_c2_726d_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l97_c22_89a0_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e3bc_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_4f22_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_4f22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l72_c2_726d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_4f22_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l86_c7_1c64] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_cond;
     tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue;
     tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_return_output := tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l72_c2_726d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_return_output;

     -- MUX[uxn_opcodes_h_l97_c22_89a0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l97_c22_89a0_cond <= VAR_MUX_uxn_opcodes_h_l97_c22_89a0_cond;
     MUX_uxn_opcodes_h_l97_c22_89a0_iftrue <= VAR_MUX_uxn_opcodes_h_l97_c22_89a0_iftrue;
     MUX_uxn_opcodes_h_l97_c22_89a0_iffalse <= VAR_MUX_uxn_opcodes_h_l97_c22_89a0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l97_c22_89a0_return_output := MUX_uxn_opcodes_h_l97_c22_89a0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l86_c7_1c64] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l86_c7_1c64] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue := VAR_MUX_uxn_opcodes_h_l97_c22_89a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_1c64_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_1c64_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_1c64_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l80_c7_1b6f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l80_c7_1b6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l94_c7_c0ab] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_cond;
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output := result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l80_c7_1b6f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_cond;
     tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output := tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_c0ab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l77_c7_4c4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l77_c7_4c4b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_cond;
     tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output := tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l77_c7_4c4b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l90_c7_4f22] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_cond;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_return_output := result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_4f22_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_726d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l86_c7_1c64] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_cond;
     result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_return_output := result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l72_c2_726d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l72_c2_726d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l72_c2_726d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_726d_cond;
     tmp16_MUX_uxn_opcodes_h_l72_c2_726d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_726d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l72_c2_726d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_726d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_726d_return_output := tmp16_MUX_uxn_opcodes_h_l72_c2_726d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l72_c2_726d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_1c64_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_726d_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l80_c7_1b6f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output := result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output;

     -- Submodule level 9
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_1b6f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l77_c7_4c4b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output := result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output;

     -- Submodule level 10
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_4c4b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l72_c2_726d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_return_output := result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a132_uxn_opcodes_h_l104_l67_DUPLICATE_b0f1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a132_uxn_opcodes_h_l104_l67_DUPLICATE_b0f1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a132(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_726d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_726d_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_726d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_726d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_726d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_726d_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a132_uxn_opcodes_h_l104_l67_DUPLICATE_b0f1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a132_uxn_opcodes_h_l104_l67_DUPLICATE_b0f1_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
