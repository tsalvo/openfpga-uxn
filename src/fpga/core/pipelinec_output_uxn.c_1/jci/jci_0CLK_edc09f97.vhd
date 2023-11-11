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
-- BIN_OP_EQ[uxn_opcodes_h_l72_c6_d326]
signal BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l72_c1_bc2a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l72_c2_083f]
signal tmp16_MUX_uxn_opcodes_h_l72_c2_083f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l72_c2_083f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l72_c2_083f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l72_c2_083f_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l72_c2_083f]
signal t8_MUX_uxn_opcodes_h_l72_c2_083f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l72_c2_083f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l72_c2_083f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l72_c2_083f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l72_c2_083f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l72_c2_083f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l72_c2_083f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l72_c2_083f]
signal result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l72_c2_083f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l72_c2_083f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l73_c3_86d2[uxn_opcodes_h_l73_c3_86d2]
signal printf_uxn_opcodes_h_l73_c3_86d2_uxn_opcodes_h_l73_c3_86d2_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l77_c11_5f0a]
signal BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l77_c7_d874]
signal tmp16_MUX_uxn_opcodes_h_l77_c7_d874_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l77_c7_d874_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l77_c7_d874_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l77_c7_d874_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l77_c7_d874]
signal t8_MUX_uxn_opcodes_h_l77_c7_d874_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l77_c7_d874_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l77_c7_d874_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l77_c7_d874_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l77_c7_d874]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l77_c7_d874]
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l77_c7_d874]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l77_c7_d874]
signal result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l77_c7_d874]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l77_c7_d874]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l80_c11_3219]
signal BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l80_c7_082c]
signal tmp16_MUX_uxn_opcodes_h_l80_c7_082c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l80_c7_082c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l80_c7_082c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l80_c7_082c_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l80_c7_082c]
signal t8_MUX_uxn_opcodes_h_l80_c7_082c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l80_c7_082c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l80_c7_082c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l80_c7_082c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l80_c7_082c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l80_c7_082c]
signal result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l80_c7_082c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l80_c7_082c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l80_c7_082c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l86_c11_7ec6]
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l86_c7_3c0c]
signal tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l86_c7_3c0c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l86_c7_3c0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l86_c7_3c0c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l86_c7_3c0c]
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_02da]
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_02da_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_02da_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_02da_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_c412]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_390b]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_390b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_390b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_390b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_390b_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_390b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_390b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l90_c7_390b]
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l92_c3_f276]
signal CONST_SL_8_uxn_opcodes_h_l92_c3_f276_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l92_c3_f276_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l94_c11_6179]
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l94_c7_433b]
signal tmp16_MUX_uxn_opcodes_h_l94_c7_433b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_433b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_433b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_433b_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l94_c7_433b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l94_c7_433b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l94_c7_433b]
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l95_c3_9427]
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_9427_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_9427_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_9427_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l97_c22_bd77]
signal BIN_OP_EQ_uxn_opcodes_h_l97_c22_bd77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c22_bd77_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c22_bd77_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c32_abfe]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c32_abfe_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c32_abfe_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c32_abfe_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_a384]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a384_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a384_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a384_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_1835]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1835_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1835_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1835_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l97_c22_a3fd]
signal MUX_uxn_opcodes_h_l97_c22_a3fd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l97_c22_a3fd_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l97_c22_a3fd_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l97_c22_a3fd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c11_30dc]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_30dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_30dc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_30dc_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l99_c7_9cf1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l99_c7_9cf1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_5d97( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_pc_updated := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326
BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_left,
BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_right,
BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l72_c2_083f
tmp16_MUX_uxn_opcodes_h_l72_c2_083f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l72_c2_083f_cond,
tmp16_MUX_uxn_opcodes_h_l72_c2_083f_iftrue,
tmp16_MUX_uxn_opcodes_h_l72_c2_083f_iffalse,
tmp16_MUX_uxn_opcodes_h_l72_c2_083f_return_output);

-- t8_MUX_uxn_opcodes_h_l72_c2_083f
t8_MUX_uxn_opcodes_h_l72_c2_083f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l72_c2_083f_cond,
t8_MUX_uxn_opcodes_h_l72_c2_083f_iftrue,
t8_MUX_uxn_opcodes_h_l72_c2_083f_iffalse,
t8_MUX_uxn_opcodes_h_l72_c2_083f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f
result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_cond,
result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_return_output);

-- printf_uxn_opcodes_h_l73_c3_86d2_uxn_opcodes_h_l73_c3_86d2
printf_uxn_opcodes_h_l73_c3_86d2_uxn_opcodes_h_l73_c3_86d2 : entity work.printf_uxn_opcodes_h_l73_c3_86d2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l73_c3_86d2_uxn_opcodes_h_l73_c3_86d2_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a
BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_left,
BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_right,
BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l77_c7_d874
tmp16_MUX_uxn_opcodes_h_l77_c7_d874 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l77_c7_d874_cond,
tmp16_MUX_uxn_opcodes_h_l77_c7_d874_iftrue,
tmp16_MUX_uxn_opcodes_h_l77_c7_d874_iffalse,
tmp16_MUX_uxn_opcodes_h_l77_c7_d874_return_output);

-- t8_MUX_uxn_opcodes_h_l77_c7_d874
t8_MUX_uxn_opcodes_h_l77_c7_d874 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l77_c7_d874_cond,
t8_MUX_uxn_opcodes_h_l77_c7_d874_iftrue,
t8_MUX_uxn_opcodes_h_l77_c7_d874_iffalse,
t8_MUX_uxn_opcodes_h_l77_c7_d874_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874
result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_cond,
result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219
BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_left,
BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_right,
BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_return_output);

-- tmp16_MUX_uxn_opcodes_h_l80_c7_082c
tmp16_MUX_uxn_opcodes_h_l80_c7_082c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l80_c7_082c_cond,
tmp16_MUX_uxn_opcodes_h_l80_c7_082c_iftrue,
tmp16_MUX_uxn_opcodes_h_l80_c7_082c_iffalse,
tmp16_MUX_uxn_opcodes_h_l80_c7_082c_return_output);

-- t8_MUX_uxn_opcodes_h_l80_c7_082c
t8_MUX_uxn_opcodes_h_l80_c7_082c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l80_c7_082c_cond,
t8_MUX_uxn_opcodes_h_l80_c7_082c_iftrue,
t8_MUX_uxn_opcodes_h_l80_c7_082c_iffalse,
t8_MUX_uxn_opcodes_h_l80_c7_082c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c
result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_cond,
result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c
result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6
BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_left,
BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_right,
BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c
tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_cond,
tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue,
tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse,
tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c
result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c
result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_cond,
result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l88_c22_02da
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_02da : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_02da_left,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_02da_right,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_02da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412
BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_390b
tmp16_MUX_uxn_opcodes_h_l90_c7_390b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_390b_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_390b_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_390b_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_390b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b
result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_cond,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l92_c3_f276
CONST_SL_8_uxn_opcodes_h_l92_c3_f276 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l92_c3_f276_x,
CONST_SL_8_uxn_opcodes_h_l92_c3_f276_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179
BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179_left,
BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179_right,
BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179_return_output);

-- tmp16_MUX_uxn_opcodes_h_l94_c7_433b
tmp16_MUX_uxn_opcodes_h_l94_c7_433b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l94_c7_433b_cond,
tmp16_MUX_uxn_opcodes_h_l94_c7_433b_iftrue,
tmp16_MUX_uxn_opcodes_h_l94_c7_433b_iffalse,
tmp16_MUX_uxn_opcodes_h_l94_c7_433b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b
result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_cond,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l95_c3_9427
BIN_OP_OR_uxn_opcodes_h_l95_c3_9427 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l95_c3_9427_left,
BIN_OP_OR_uxn_opcodes_h_l95_c3_9427_right,
BIN_OP_OR_uxn_opcodes_h_l95_c3_9427_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l97_c22_bd77
BIN_OP_EQ_uxn_opcodes_h_l97_c22_bd77 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l97_c22_bd77_left,
BIN_OP_EQ_uxn_opcodes_h_l97_c22_bd77_right,
BIN_OP_EQ_uxn_opcodes_h_l97_c22_bd77_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c32_abfe
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_abfe : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_abfe_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_abfe_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_abfe_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a384
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a384 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a384_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a384_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a384_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1835
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1835 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1835_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1835_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1835_return_output);

-- MUX_uxn_opcodes_h_l97_c22_a3fd
MUX_uxn_opcodes_h_l97_c22_a3fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l97_c22_a3fd_cond,
MUX_uxn_opcodes_h_l97_c22_a3fd_iftrue,
MUX_uxn_opcodes_h_l97_c22_a3fd_iffalse,
MUX_uxn_opcodes_h_l97_c22_a3fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c11_30dc
BIN_OP_EQ_uxn_opcodes_h_l99_c11_30dc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c11_30dc_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c11_30dc_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c11_30dc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_return_output,
 tmp16_MUX_uxn_opcodes_h_l72_c2_083f_return_output,
 t8_MUX_uxn_opcodes_h_l72_c2_083f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_return_output,
 tmp16_MUX_uxn_opcodes_h_l77_c7_d874_return_output,
 t8_MUX_uxn_opcodes_h_l77_c7_d874_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_return_output,
 tmp16_MUX_uxn_opcodes_h_l80_c7_082c_return_output,
 t8_MUX_uxn_opcodes_h_l80_c7_082c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_return_output,
 tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l88_c22_02da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_390b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_return_output,
 CONST_SL_8_uxn_opcodes_h_l92_c3_f276_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179_return_output,
 tmp16_MUX_uxn_opcodes_h_l94_c7_433b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l95_c3_9427_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l97_c22_bd77_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c32_abfe_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a384_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1835_return_output,
 MUX_uxn_opcodes_h_l97_c22_a3fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c11_30dc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_083f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_083f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_d874_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_083f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_083f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l72_c2_083f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l72_c2_083f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_d874_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l72_c2_083f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l72_c2_083f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_6db2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l73_c3_86d2_uxn_opcodes_h_l73_c3_86d2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_d874_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_d874_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_082c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_d874_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_d874_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_d874_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l80_c7_082c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_d874_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l78_c3_2a94 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l77_c7_d874_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_082c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_082c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_082c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l80_c7_082c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l80_c7_082c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l80_c7_082c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_ad6b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_390b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l88_c3_8c02 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_02da_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_02da_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_02da_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_390b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_390b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_433b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_390b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_f276_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_f276_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_433b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_433b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_433b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_9427_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_9427_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_9427_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_a3fd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_a3fd_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_a3fd_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_bd77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_bd77_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_bd77_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_abfe_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_abfe_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_abfe_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a384_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a384_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a384_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1835_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1835_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1835_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_a3fd_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_30dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_30dc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_30dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_63d4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l94_l72_l77_l90_DUPLICATE_6b3f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l80_l72_l77_DUPLICATE_dcab_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l80_l77_l72_l99_l90_l86_DUPLICATE_defc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l80_l77_l99_l94_l90_l86_DUPLICATE_e962_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l91_l95_DUPLICATE_c0d2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5d97_uxn_opcodes_h_l67_l104_DUPLICATE_57f9_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_abfe_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_bd77_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_02da_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1835_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_30dc_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l78_c3_2a94 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l78_c3_2a94;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_ad6b := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_ad6b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_6db2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_6db2;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_02da_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_abfe_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a384_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_30dc_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l80_c7_082c_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_bd77_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l72_c2_083f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_d874_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l80_c7_082c_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_9427_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_083f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_d874_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_082c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_433b_iffalse := tmp16;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l77_c7_d874] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l77_c7_d874_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l94_l72_l77_l90_DUPLICATE_6b3f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l94_l72_l77_l90_DUPLICATE_6b3f_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l77_c11_5f0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l91_l95_DUPLICATE_c0d2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l91_l95_DUPLICATE_c0d2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l99_c11_30dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c11_30dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_30dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c11_30dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_30dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_30dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c11_30dc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l86_c11_7ec6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_left;
     BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_return_output := BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l72_c6_d326] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_left;
     BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_return_output := BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l80_c11_3219] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_left;
     BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_return_output := BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l80_l77_l72_l99_l90_l86_DUPLICATE_defc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l80_l77_l72_l99_l90_l86_DUPLICATE_defc_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_63d4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_63d4_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l97_c22_bd77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l97_c22_bd77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_bd77_left;
     BIN_OP_EQ_uxn_opcodes_h_l97_c22_bd77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_bd77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_bd77_return_output := BIN_OP_EQ_uxn_opcodes_h_l97_c22_bd77_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l80_l72_l77_DUPLICATE_dcab LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l80_l72_l77_DUPLICATE_dcab_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l94_c11_6179] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179_left;
     BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179_return_output := BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_c412] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l80_l77_l99_l94_l90_l86_DUPLICATE_e962 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l80_l77_l99_l94_l90_l86_DUPLICATE_e962_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c32_abfe] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c32_abfe_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_abfe_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c32_abfe_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_abfe_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_abfe_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c32_abfe_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_02da] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_02da_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_02da_left;
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_02da_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_02da_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_02da_return_output := BIN_OP_PLUS_uxn_opcodes_h_l88_c22_02da_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l72_c2_083f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_083f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_d326_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_d874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_d874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5f0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l80_c7_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_3219_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_7ec6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_390b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c412_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_433b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_6179_return_output;
     VAR_MUX_uxn_opcodes_h_l97_c22_a3fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_bd77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_30dc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_30dc_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l88_c3_8c02 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_02da_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l97_c22_a3fd_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_abfe_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_9427_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l91_l95_DUPLICATE_c0d2_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_f276_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l91_l95_DUPLICATE_c0d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l80_l72_l77_DUPLICATE_dcab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l80_l72_l77_DUPLICATE_dcab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l80_l72_l77_DUPLICATE_dcab_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l94_l72_l77_l90_DUPLICATE_6b3f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l94_l72_l77_l90_DUPLICATE_6b3f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l94_l72_l77_l90_DUPLICATE_6b3f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l94_l72_l77_l90_DUPLICATE_6b3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l80_l77_l99_l94_l90_l86_DUPLICATE_e962_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l80_l77_l99_l94_l90_l86_DUPLICATE_e962_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l80_l77_l99_l94_l90_l86_DUPLICATE_e962_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l80_l77_l99_l94_l90_l86_DUPLICATE_e962_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l80_l77_l99_l94_l90_l86_DUPLICATE_e962_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l80_l77_l99_l94_l90_l86_DUPLICATE_e962_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l80_l77_l72_l99_l90_l86_DUPLICATE_defc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l80_l77_l72_l99_l90_l86_DUPLICATE_defc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l80_l77_l72_l99_l90_l86_DUPLICATE_defc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l80_l77_l72_l99_l90_l86_DUPLICATE_defc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l80_l77_l72_l99_l90_l86_DUPLICATE_defc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l80_l77_l72_l99_l90_l86_DUPLICATE_defc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_63d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_63d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_63d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l77_c7_d874_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue := VAR_result_u16_value_uxn_opcodes_h_l88_c3_8c02;
     -- BIN_OP_OR[uxn_opcodes_h_l95_c3_9427] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l95_c3_9427_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_9427_left;
     BIN_OP_OR_uxn_opcodes_h_l95_c3_9427_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_9427_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_9427_return_output := BIN_OP_OR_uxn_opcodes_h_l95_c3_9427_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l99_c7_9cf1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l80_c7_082c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l72_c1_bc2a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l86_c7_3c0c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l99_c7_9cf1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_return_output;

     -- t8_MUX[uxn_opcodes_h_l80_c7_082c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l80_c7_082c_cond <= VAR_t8_MUX_uxn_opcodes_h_l80_c7_082c_cond;
     t8_MUX_uxn_opcodes_h_l80_c7_082c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l80_c7_082c_iftrue;
     t8_MUX_uxn_opcodes_h_l80_c7_082c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l80_c7_082c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l80_c7_082c_return_output := t8_MUX_uxn_opcodes_h_l80_c7_082c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l77_c7_d874] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l92_c3_f276] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l92_c3_f276_x <= VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_f276_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_f276_return_output := CONST_SL_8_uxn_opcodes_h_l92_c3_f276_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a384_right := VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_9427_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_433b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_9427_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_390b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_f276_return_output;
     VAR_printf_uxn_opcodes_h_l73_c3_86d2_uxn_opcodes_h_l73_c3_86d2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_bc2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_9cf1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_9cf1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_082c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_d874_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_d874_iffalse := VAR_t8_MUX_uxn_opcodes_h_l80_c7_082c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l94_c7_433b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_return_output;

     -- printf_uxn_opcodes_h_l73_c3_86d2[uxn_opcodes_h_l73_c3_86d2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l73_c3_86d2_uxn_opcodes_h_l73_c3_86d2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l73_c3_86d2_uxn_opcodes_h_l73_c3_86d2_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_a384] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a384_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a384_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a384_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a384_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a384_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a384_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l72_c2_083f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_return_output;

     -- t8_MUX[uxn_opcodes_h_l77_c7_d874] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l77_c7_d874_cond <= VAR_t8_MUX_uxn_opcodes_h_l77_c7_d874_cond;
     t8_MUX_uxn_opcodes_h_l77_c7_d874_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l77_c7_d874_iftrue;
     t8_MUX_uxn_opcodes_h_l77_c7_d874_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l77_c7_d874_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_d874_return_output := t8_MUX_uxn_opcodes_h_l77_c7_d874_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l80_c7_082c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l94_c7_433b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l94_c7_433b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_433b_cond;
     tmp16_MUX_uxn_opcodes_h_l94_c7_433b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_433b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l94_c7_433b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_433b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_433b_return_output := tmp16_MUX_uxn_opcodes_h_l94_c7_433b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l77_c7_d874] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l94_c7_433b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1835_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a384_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_433b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_433b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_082c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_d874_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l72_c2_083f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l77_c7_d874_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_390b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_433b_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_390b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l72_c2_083f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_return_output;

     -- t8_MUX[uxn_opcodes_h_l72_c2_083f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l72_c2_083f_cond <= VAR_t8_MUX_uxn_opcodes_h_l72_c2_083f_cond;
     t8_MUX_uxn_opcodes_h_l72_c2_083f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l72_c2_083f_iftrue;
     t8_MUX_uxn_opcodes_h_l72_c2_083f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l72_c2_083f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l72_c2_083f_return_output := t8_MUX_uxn_opcodes_h_l72_c2_083f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l90_c7_390b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_390b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_390b_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_390b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_390b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_390b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_390b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_390b_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_390b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_1835] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1835_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1835_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1835_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1835_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1835_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1835_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_390b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l77_c7_d874] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l97_c22_a3fd_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1835_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_390b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_390b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_d874_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l72_c2_083f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_390b_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l86_c7_3c0c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_cond;
     tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output := tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output;

     -- MUX[uxn_opcodes_h_l97_c22_a3fd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l97_c22_a3fd_cond <= VAR_MUX_uxn_opcodes_h_l97_c22_a3fd_cond;
     MUX_uxn_opcodes_h_l97_c22_a3fd_iftrue <= VAR_MUX_uxn_opcodes_h_l97_c22_a3fd_iftrue;
     MUX_uxn_opcodes_h_l97_c22_a3fd_iffalse <= VAR_MUX_uxn_opcodes_h_l97_c22_a3fd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l97_c22_a3fd_return_output := MUX_uxn_opcodes_h_l97_c22_a3fd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l86_c7_3c0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l72_c2_083f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l86_c7_3c0c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_iftrue := VAR_MUX_uxn_opcodes_h_l97_c22_a3fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_082c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l80_c7_082c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l80_c7_082c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_082c_cond;
     tmp16_MUX_uxn_opcodes_h_l80_c7_082c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_082c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l80_c7_082c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_082c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_082c_return_output := tmp16_MUX_uxn_opcodes_h_l80_c7_082c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l94_c7_433b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_return_output := result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l80_c7_082c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l80_c7_082c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_082c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_082c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_433b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_d874_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_082c_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l90_c7_390b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_return_output := result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l77_c7_d874] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l77_c7_d874] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l77_c7_d874_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_d874_cond;
     tmp16_MUX_uxn_opcodes_h_l77_c7_d874_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_d874_iftrue;
     tmp16_MUX_uxn_opcodes_h_l77_c7_d874_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_d874_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_d874_return_output := tmp16_MUX_uxn_opcodes_h_l77_c7_d874_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l77_c7_d874] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_d874_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_d874_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_390b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_083f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_d874_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l72_c2_083f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l72_c2_083f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l72_c2_083f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_083f_cond;
     tmp16_MUX_uxn_opcodes_h_l72_c2_083f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_083f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l72_c2_083f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_083f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_083f_return_output := tmp16_MUX_uxn_opcodes_h_l72_c2_083f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l86_c7_3c0c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output := result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l72_c2_083f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_3c0c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_083f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l80_c7_082c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_return_output := result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_return_output;

     -- Submodule level 9
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_082c_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l77_c7_d874] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_cond;
     result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_return_output := result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_return_output;

     -- Submodule level 10
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_d874_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l72_c2_083f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_return_output := result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5d97_uxn_opcodes_h_l67_l104_DUPLICATE_57f9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5d97_uxn_opcodes_h_l67_l104_DUPLICATE_57f9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5d97(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_083f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_083f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_083f_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_083f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_083f_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_083f_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5d97_uxn_opcodes_h_l67_l104_DUPLICATE_57f9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5d97_uxn_opcodes_h_l67_l104_DUPLICATE_57f9_return_output;
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
