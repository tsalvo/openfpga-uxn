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
-- Submodules: 76
entity dup2_0CLK_ad7496ca is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dup2_0CLK_ad7496ca;
architecture arch of dup2_0CLK_ad7496ca is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l3064_c6_fabc]
signal BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3064_c1_803e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3064_c2_7a43]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3064_c2_7a43]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3064_c2_7a43]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3064_c2_7a43]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3064_c2_7a43]
signal result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3064_c2_7a43]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3064_c2_7a43]
signal t16_MUX_uxn_opcodes_h_l3064_c2_7a43_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l3065_c3_8454[uxn_opcodes_h_l3065_c3_8454]
signal printf_uxn_opcodes_h_l3065_c3_8454_uxn_opcodes_h_l3065_c3_8454_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3069_c11_aab3]
signal BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3069_c7_f65e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3069_c7_f65e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3069_c7_f65e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3069_c7_f65e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3069_c7_f65e]
signal result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3069_c7_f65e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3069_c7_f65e]
signal t16_MUX_uxn_opcodes_h_l3069_c7_f65e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3072_c11_905b]
signal BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3072_c7_fd73]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3072_c7_fd73]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3072_c7_fd73]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3072_c7_fd73]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3072_c7_fd73]
signal result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3072_c7_fd73]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3072_c7_fd73]
signal t16_MUX_uxn_opcodes_h_l3072_c7_fd73_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l3074_c3_788d]
signal CONST_SL_8_uxn_opcodes_h_l3074_c3_788d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l3074_c3_788d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3077_c11_7d50]
signal BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3077_c7_f517]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3077_c7_f517]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3077_c7_f517]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3077_c7_f517]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3077_c7_f517]
signal result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3077_c7_f517]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3077_c7_f517]
signal t16_MUX_uxn_opcodes_h_l3077_c7_f517_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3077_c7_f517_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3080_c11_482b]
signal BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3080_c7_1f66]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3080_c7_1f66]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3080_c7_1f66]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3080_c7_1f66]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3080_c7_1f66]
signal result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3080_c7_1f66]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3080_c7_1f66]
signal t16_MUX_uxn_opcodes_h_l3080_c7_1f66_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l3081_c3_b5c0]
signal BIN_OP_OR_uxn_opcodes_h_l3081_c3_b5c0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3081_c3_b5c0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3081_c3_b5c0_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3083_c32_4c4b]
signal BIN_OP_AND_uxn_opcodes_h_l3083_c32_4c4b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3083_c32_4c4b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3083_c32_4c4b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3083_c32_cafd]
signal BIN_OP_GT_uxn_opcodes_h_l3083_c32_cafd_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3083_c32_cafd_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3083_c32_cafd_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3083_c32_ac2e]
signal MUX_uxn_opcodes_h_l3083_c32_ac2e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3083_c32_ac2e_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3083_c32_ac2e_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3083_c32_ac2e_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3085_c11_60e7]
signal BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3085_c7_ee83]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3085_c7_ee83]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3085_c7_ee83]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3085_c7_ee83]
signal result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3085_c7_ee83]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3091_c11_ad17]
signal BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3091_c7_5409]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3091_c7_5409]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3091_c7_5409]
signal result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3091_c7_5409]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3095_c11_61a2]
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3095_c7_6bbf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3095_c7_6bbf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3095_c7_6bbf]
signal result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3095_c7_6bbf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3099_c11_cdac]
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3099_c7_1bd4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3099_c7_1bd4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3099_c7_1bd4]
signal result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3099_c7_1bd4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3103_c11_ee70]
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ee70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ee70_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ee70_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3103_c7_352d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3103_c7_352d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_return_output : unsigned(0 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_d1a9
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_d1a9_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_d1a9_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_53ff( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc
BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_left,
BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_right,
BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43
result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43
result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43
result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43
result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_cond,
result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43
result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output);

-- t16_MUX_uxn_opcodes_h_l3064_c2_7a43
t16_MUX_uxn_opcodes_h_l3064_c2_7a43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3064_c2_7a43_cond,
t16_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue,
t16_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse,
t16_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output);

-- printf_uxn_opcodes_h_l3065_c3_8454_uxn_opcodes_h_l3065_c3_8454
printf_uxn_opcodes_h_l3065_c3_8454_uxn_opcodes_h_l3065_c3_8454 : entity work.printf_uxn_opcodes_h_l3065_c3_8454_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3065_c3_8454_uxn_opcodes_h_l3065_c3_8454_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3
BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_left,
BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_right,
BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e
result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e
result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e
result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e
result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_cond,
result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e
result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output);

-- t16_MUX_uxn_opcodes_h_l3069_c7_f65e
t16_MUX_uxn_opcodes_h_l3069_c7_f65e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3069_c7_f65e_cond,
t16_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue,
t16_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse,
t16_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b
BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_left,
BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_right,
BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73
result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73
result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73
result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73
result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_cond,
result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73
result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output);

-- t16_MUX_uxn_opcodes_h_l3072_c7_fd73
t16_MUX_uxn_opcodes_h_l3072_c7_fd73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3072_c7_fd73_cond,
t16_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue,
t16_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse,
t16_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output);

-- CONST_SL_8_uxn_opcodes_h_l3074_c3_788d
CONST_SL_8_uxn_opcodes_h_l3074_c3_788d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l3074_c3_788d_x,
CONST_SL_8_uxn_opcodes_h_l3074_c3_788d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50
BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_left,
BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_right,
BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517
result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517
result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517
result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517
result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_cond,
result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517
result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_return_output);

-- t16_MUX_uxn_opcodes_h_l3077_c7_f517
t16_MUX_uxn_opcodes_h_l3077_c7_f517 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3077_c7_f517_cond,
t16_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue,
t16_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse,
t16_MUX_uxn_opcodes_h_l3077_c7_f517_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b
BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_left,
BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_right,
BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66
result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66
result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66
result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66
result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_cond,
result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66
result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output);

-- t16_MUX_uxn_opcodes_h_l3080_c7_1f66
t16_MUX_uxn_opcodes_h_l3080_c7_1f66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3080_c7_1f66_cond,
t16_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue,
t16_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse,
t16_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l3081_c3_b5c0
BIN_OP_OR_uxn_opcodes_h_l3081_c3_b5c0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l3081_c3_b5c0_left,
BIN_OP_OR_uxn_opcodes_h_l3081_c3_b5c0_right,
BIN_OP_OR_uxn_opcodes_h_l3081_c3_b5c0_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3083_c32_4c4b
BIN_OP_AND_uxn_opcodes_h_l3083_c32_4c4b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3083_c32_4c4b_left,
BIN_OP_AND_uxn_opcodes_h_l3083_c32_4c4b_right,
BIN_OP_AND_uxn_opcodes_h_l3083_c32_4c4b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3083_c32_cafd
BIN_OP_GT_uxn_opcodes_h_l3083_c32_cafd : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3083_c32_cafd_left,
BIN_OP_GT_uxn_opcodes_h_l3083_c32_cafd_right,
BIN_OP_GT_uxn_opcodes_h_l3083_c32_cafd_return_output);

-- MUX_uxn_opcodes_h_l3083_c32_ac2e
MUX_uxn_opcodes_h_l3083_c32_ac2e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3083_c32_ac2e_cond,
MUX_uxn_opcodes_h_l3083_c32_ac2e_iftrue,
MUX_uxn_opcodes_h_l3083_c32_ac2e_iffalse,
MUX_uxn_opcodes_h_l3083_c32_ac2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_left,
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_right,
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83
result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83
result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83
result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_cond,
result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83
result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17_left,
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17_right,
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409
result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409
result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_cond,
result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409
result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2_left,
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2_right,
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond,
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac_left,
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac_right,
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4
result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4
result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond,
result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4
result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ee70
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ee70 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ee70_left,
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ee70_right,
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ee70_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d
result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d
result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_d1a9
CONST_SR_8_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_d1a9 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_d1a9_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_d1a9_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output,
 t16_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output,
 t16_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output,
 t16_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output,
 CONST_SL_8_uxn_opcodes_h_l3074_c3_788d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_return_output,
 t16_MUX_uxn_opcodes_h_l3077_c7_f517_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output,
 t16_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output,
 BIN_OP_OR_uxn_opcodes_h_l3081_c3_b5c0_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3083_c32_4c4b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3083_c32_cafd_return_output,
 MUX_uxn_opcodes_h_l3083_c32_ac2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ee70_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_d1a9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3066_c3_f463 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3064_c2_7a43_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3065_c3_8454_uxn_opcodes_h_l3065_c3_8454_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3070_c3_659a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3069_c7_f65e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3075_c3_ec05 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3077_c7_f517_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3072_c7_fd73_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l3074_c3_788d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l3074_c3_788d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3078_c3_761c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3077_c7_f517_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3080_c7_1f66_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3081_c3_b5c0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3081_c3_b5c0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3081_c3_b5c0_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3083_c32_ac2e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3083_c32_ac2e_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3083_c32_ac2e_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3083_c32_4c4b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3083_c32_4c4b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3083_c32_4c4b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3083_c32_cafd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3083_c32_cafd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3083_c32_cafd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3083_c32_ac2e_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3088_c3_06ca : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3092_c3_16e4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3096_c3_43fb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3100_c3_9491 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ee70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ee70_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ee70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3064_l3080_DUPLICATE_86ed_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3077_l3072_l3069_l3064_l3080_DUPLICATE_2e12_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3077_l3099_l3072_l3069_l3064_l3080_DUPLICATE_e83d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3077_l3072_l3069_l3064_l3085_DUPLICATE_8c86_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3085_l3080_DUPLICATE_9846_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3073_l3081_DUPLICATE_4cd9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3080_l3099_DUPLICATE_3d64_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3089_l3097_DUPLICATE_3bd2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_d1a9_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_d1a9_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_1dab_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l3108_l3060_DUPLICATE_c240_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3066_c3_f463 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3066_c3_f463;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ee70_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3096_c3_43fb := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3096_c3_43fb;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3083_c32_4c4b_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3088_c3_06ca := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3088_c3_06ca;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3100_c3_9491 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3100_c3_9491;
     VAR_BIN_OP_GT_uxn_opcodes_h_l3083_c32_cafd_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l3083_c32_ac2e_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3078_c3_761c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3078_c3_761c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3075_c3_ec05 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3075_c3_ec05;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3092_c3_16e4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3092_c3_16e4;
     VAR_MUX_uxn_opcodes_h_l3083_c32_ac2e_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3070_c3_659a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3070_c3_659a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3083_c32_4c4b_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ee70_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3081_c3_b5c0_left := t16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_d1a9_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse := t16;
     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3077_l3072_l3069_l3064_l3080_DUPLICATE_2e12 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3077_l3072_l3069_l3064_l3080_DUPLICATE_2e12_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3080_l3099_DUPLICATE_3d64 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3080_l3099_DUPLICATE_3d64_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l3091_c11_ad17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17_left;
     BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17_return_output := BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3099_c11_cdac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac_left;
     BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac_return_output := BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l3083_c32_4c4b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3083_c32_4c4b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3083_c32_4c4b_left;
     BIN_OP_AND_uxn_opcodes_h_l3083_c32_4c4b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3083_c32_4c4b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3083_c32_4c4b_return_output := BIN_OP_AND_uxn_opcodes_h_l3083_c32_4c4b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3064_l3080_DUPLICATE_86ed LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3064_l3080_DUPLICATE_86ed_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3085_l3080_DUPLICATE_9846 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3085_l3080_DUPLICATE_9846_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3077_l3099_l3072_l3069_l3064_l3080_DUPLICATE_e83d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3077_l3099_l3072_l3069_l3064_l3080_DUPLICATE_e83d_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l3103_c11_ee70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ee70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ee70_left;
     BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ee70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ee70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ee70_return_output := BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ee70_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3064_c6_fabc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_left;
     BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_return_output := BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_d1a9 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_d1a9_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_d1a9_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_d1a9_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_d1a9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3077_l3072_l3069_l3064_l3085_DUPLICATE_8c86 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3077_l3072_l3069_l3064_l3085_DUPLICATE_8c86_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l3069_c11_aab3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3089_l3097_DUPLICATE_3bd2 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3089_l3097_DUPLICATE_3bd2_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l3072_c11_905b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3085_c11_60e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3073_l3081_DUPLICATE_4cd9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3073_l3081_DUPLICATE_4cd9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l3095_c11_61a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3080_c11_482b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3077_c11_7d50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_left;
     BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_return_output := BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3083_c32_cafd_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3083_c32_4c4b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3064_c2_7a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c6_fabc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3069_c7_f65e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_aab3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3072_c7_fd73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_905b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3077_c7_f517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_7d50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3080_c7_1f66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_482b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_60e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_ad17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_61a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cdac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ee70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ee70_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3081_c3_b5c0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3073_l3081_DUPLICATE_4cd9_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l3074_c3_788d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3073_l3081_DUPLICATE_4cd9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3089_l3097_DUPLICATE_3bd2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3089_l3097_DUPLICATE_3bd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3077_l3072_l3069_l3064_l3080_DUPLICATE_2e12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3077_l3072_l3069_l3064_l3080_DUPLICATE_2e12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3077_l3072_l3069_l3064_l3080_DUPLICATE_2e12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3077_l3072_l3069_l3064_l3080_DUPLICATE_2e12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3077_l3072_l3069_l3064_l3080_DUPLICATE_2e12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3085_l3080_DUPLICATE_9846_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3085_l3080_DUPLICATE_9846_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3085_l3080_DUPLICATE_9846_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3085_l3080_DUPLICATE_9846_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3085_l3080_DUPLICATE_9846_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3085_l3080_DUPLICATE_9846_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3085_l3080_DUPLICATE_9846_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3085_l3080_DUPLICATE_9846_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3085_l3080_DUPLICATE_9846_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3077_l3072_l3069_l3064_l3085_DUPLICATE_8c86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3077_l3072_l3069_l3064_l3085_DUPLICATE_8c86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3077_l3072_l3069_l3064_l3085_DUPLICATE_8c86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3077_l3072_l3069_l3064_l3085_DUPLICATE_8c86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3077_l3072_l3069_l3064_l3085_DUPLICATE_8c86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3064_l3080_DUPLICATE_86ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3064_l3080_DUPLICATE_86ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3064_l3080_DUPLICATE_86ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3064_l3080_DUPLICATE_86ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3064_l3080_DUPLICATE_86ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3064_l3080_DUPLICATE_86ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3064_l3080_DUPLICATE_86ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3064_l3080_DUPLICATE_86ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3077_l3099_l3072_l3095_l3069_l3091_l3064_l3080_DUPLICATE_86ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3080_l3099_DUPLICATE_3d64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3080_l3099_DUPLICATE_3d64_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3077_l3099_l3072_l3069_l3064_l3080_DUPLICATE_e83d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3077_l3099_l3072_l3069_l3064_l3080_DUPLICATE_e83d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3077_l3099_l3072_l3069_l3064_l3080_DUPLICATE_e83d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3077_l3099_l3072_l3069_l3064_l3080_DUPLICATE_e83d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3077_l3099_l3072_l3069_l3064_l3080_DUPLICATE_e83d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3077_l3099_l3072_l3069_l3064_l3080_DUPLICATE_e83d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3103_c7_352d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_1dab LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_1dab_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_d1a9_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3103_c7_352d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3099_c7_1bd4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l3083_c32_cafd] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3083_c32_cafd_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3083_c32_cafd_left;
     BIN_OP_GT_uxn_opcodes_h_l3083_c32_cafd_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3083_c32_cafd_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3083_c32_cafd_return_output := BIN_OP_GT_uxn_opcodes_h_l3083_c32_cafd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3085_c7_ee83] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l3074_c3_788d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l3074_c3_788d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l3074_c3_788d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l3074_c3_788d_return_output := CONST_SL_8_uxn_opcodes_h_l3074_c3_788d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l3081_c3_b5c0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l3081_c3_b5c0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l3081_c3_b5c0_left;
     BIN_OP_OR_uxn_opcodes_h_l3081_c3_b5c0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l3081_c3_b5c0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l3081_c3_b5c0_return_output := BIN_OP_OR_uxn_opcodes_h_l3081_c3_b5c0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3064_c1_803e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3083_c32_ac2e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3083_c32_cafd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l3081_c3_b5c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_1dab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_1dab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l3074_c3_788d_return_output;
     VAR_printf_uxn_opcodes_h_l3065_c3_8454_uxn_opcodes_h_l3065_c3_8454_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_803e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_352d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_352d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3080_c7_1f66] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output;

     -- MUX[uxn_opcodes_h_l3083_c32_ac2e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3083_c32_ac2e_cond <= VAR_MUX_uxn_opcodes_h_l3083_c32_ac2e_cond;
     MUX_uxn_opcodes_h_l3083_c32_ac2e_iftrue <= VAR_MUX_uxn_opcodes_h_l3083_c32_ac2e_iftrue;
     MUX_uxn_opcodes_h_l3083_c32_ac2e_iffalse <= VAR_MUX_uxn_opcodes_h_l3083_c32_ac2e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3083_c32_ac2e_return_output := MUX_uxn_opcodes_h_l3083_c32_ac2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3099_c7_1bd4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output;

     -- t16_MUX[uxn_opcodes_h_l3080_c7_1f66] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3080_c7_1f66_cond <= VAR_t16_MUX_uxn_opcodes_h_l3080_c7_1f66_cond;
     t16_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue;
     t16_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output := t16_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3095_c7_6bbf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output;

     -- printf_uxn_opcodes_h_l3065_c3_8454[uxn_opcodes_h_l3065_c3_8454] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3065_c3_8454_uxn_opcodes_h_l3065_c3_8454_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3065_c3_8454_uxn_opcodes_h_l3065_c3_8454_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l3099_c7_1bd4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output := result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3099_c7_1bd4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue := VAR_MUX_uxn_opcodes_h_l3083_c32_ac2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_1bd4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output;
     -- t16_MUX[uxn_opcodes_h_l3077_c7_f517] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3077_c7_f517_cond <= VAR_t16_MUX_uxn_opcodes_h_l3077_c7_f517_cond;
     t16_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue;
     t16_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3077_c7_f517_return_output := t16_MUX_uxn_opcodes_h_l3077_c7_f517_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3095_c7_6bbf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3095_c7_6bbf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3095_c7_6bbf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output := result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3077_c7_f517] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3091_c7_5409] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3080_c7_1f66] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3077_c7_f517_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_5409_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_6bbf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3077_c7_f517_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3085_c7_ee83] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3091_c7_5409] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_return_output := result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3091_c7_5409] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3091_c7_5409] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3072_c7_fd73] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3077_c7_f517] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_return_output;

     -- t16_MUX[uxn_opcodes_h_l3072_c7_fd73] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3072_c7_fd73_cond <= VAR_t16_MUX_uxn_opcodes_h_l3072_c7_fd73_cond;
     t16_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue;
     t16_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output := t16_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_5409_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_5409_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3077_c7_f517_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_5409_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3085_c7_ee83] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3072_c7_fd73] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3085_c7_ee83] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3080_c7_1f66] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3085_c7_ee83] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output := result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3069_c7_f65e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output;

     -- t16_MUX[uxn_opcodes_h_l3069_c7_f65e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3069_c7_f65e_cond <= VAR_t16_MUX_uxn_opcodes_h_l3069_c7_f65e_cond;
     t16_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue;
     t16_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output := t16_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_ee83_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3069_c7_f65e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3080_c7_1f66] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3080_c7_1f66] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3064_c2_7a43] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3077_c7_f517] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_return_output;

     -- t16_MUX[uxn_opcodes_h_l3064_c2_7a43] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3064_c2_7a43_cond <= VAR_t16_MUX_uxn_opcodes_h_l3064_c2_7a43_cond;
     t16_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue;
     t16_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output := t16_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3080_c7_1f66] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output := result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3077_c7_f517_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3080_c7_1f66_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3077_c7_f517] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3077_c7_f517] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_return_output := result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3072_c7_fd73] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3077_c7_f517] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3064_c2_7a43] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3077_c7_f517_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3077_c7_f517_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3077_c7_f517_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3072_c7_fd73] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3072_c7_fd73] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3069_c7_f65e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3072_c7_fd73] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output := result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3072_c7_fd73_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3069_c7_f65e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3069_c7_f65e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output := result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3064_c2_7a43] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3069_c7_f65e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3069_c7_f65e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3064_c2_7a43] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3064_c2_7a43] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output := result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3064_c2_7a43] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l3108_l3060_DUPLICATE_c240 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l3108_l3060_DUPLICATE_c240_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3064_c2_7a43_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l3108_l3060_DUPLICATE_c240_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l3108_l3060_DUPLICATE_c240_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
