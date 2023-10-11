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
-- Submodules: 127
entity ovr2_0CLK_9fd731de is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr2_0CLK_9fd731de;
architecture arch of ovr2_0CLK_9fd731de is
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
-- BIN_OP_EQ[uxn_opcodes_h_l348_c6_d2ad]
signal BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l348_c1_bfcf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l348_c2_218d]
signal t16_MUX_uxn_opcodes_h_l348_c2_218d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l348_c2_218d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l348_c2_218d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l348_c2_218d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l348_c2_218d]
signal n16_MUX_uxn_opcodes_h_l348_c2_218d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l348_c2_218d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l348_c2_218d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l348_c2_218d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l348_c2_218d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l348_c2_218d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l348_c2_218d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l348_c2_218d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l348_c2_218d]
signal result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l348_c2_218d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l349_c3_257e[uxn_opcodes_h_l349_c3_257e]
signal printf_uxn_opcodes_h_l349_c3_257e_uxn_opcodes_h_l349_c3_257e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l353_c11_aeba]
signal BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l353_c7_9e83]
signal t16_MUX_uxn_opcodes_h_l353_c7_9e83_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l353_c7_9e83_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l353_c7_9e83]
signal n16_MUX_uxn_opcodes_h_l353_c7_9e83_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l353_c7_9e83_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l353_c7_9e83]
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l353_c7_9e83]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l353_c7_9e83]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l353_c7_9e83]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l353_c7_9e83]
signal result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l353_c7_9e83]
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l356_c11_86a9]
signal BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l356_c7_4fe5]
signal t16_MUX_uxn_opcodes_h_l356_c7_4fe5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l356_c7_4fe5]
signal n16_MUX_uxn_opcodes_h_l356_c7_4fe5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l356_c7_4fe5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l356_c7_4fe5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l356_c7_4fe5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l356_c7_4fe5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l356_c7_4fe5]
signal result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l356_c7_4fe5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l361_c11_12da]
signal BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l361_c7_6a27]
signal t16_MUX_uxn_opcodes_h_l361_c7_6a27_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l361_c7_6a27_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l361_c7_6a27]
signal n16_MUX_uxn_opcodes_h_l361_c7_6a27_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l361_c7_6a27_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l361_c7_6a27]
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l361_c7_6a27]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l361_c7_6a27]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l361_c7_6a27]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l361_c7_6a27]
signal result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l361_c7_6a27]
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l364_c11_0339]
signal BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l364_c7_75c0]
signal t16_MUX_uxn_opcodes_h_l364_c7_75c0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l364_c7_75c0_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l364_c7_75c0]
signal n16_MUX_uxn_opcodes_h_l364_c7_75c0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l364_c7_75c0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l364_c7_75c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l364_c7_75c0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l364_c7_75c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l364_c7_75c0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l364_c7_75c0]
signal result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l364_c7_75c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l365_c3_ba48]
signal BIN_OP_OR_uxn_opcodes_h_l365_c3_ba48_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l365_c3_ba48_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l365_c3_ba48_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l368_c11_4188]
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l368_c7_e91e]
signal n16_MUX_uxn_opcodes_h_l368_c7_e91e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l368_c7_e91e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l368_c7_e91e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l368_c7_e91e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l368_c7_e91e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l368_c7_e91e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l368_c7_e91e]
signal result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l368_c7_e91e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l371_c11_7884]
signal BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l371_c7_66ab]
signal n16_MUX_uxn_opcodes_h_l371_c7_66ab_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l371_c7_66ab_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l371_c7_66ab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l371_c7_66ab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l371_c7_66ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l371_c7_66ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l371_c7_66ab]
signal result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l371_c7_66ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l376_c11_3f5c]
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l376_c7_4dfc]
signal n16_MUX_uxn_opcodes_h_l376_c7_4dfc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l376_c7_4dfc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l376_c7_4dfc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_4dfc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l376_c7_4dfc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l376_c7_4dfc]
signal result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_4dfc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l379_c11_0dbe]
signal BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l379_c7_a9a7]
signal n16_MUX_uxn_opcodes_h_l379_c7_a9a7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l379_c7_a9a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l379_c7_a9a7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l379_c7_a9a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l379_c7_a9a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l379_c7_a9a7]
signal result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l379_c7_a9a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l380_c3_d19a]
signal BIN_OP_OR_uxn_opcodes_h_l380_c3_d19a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l380_c3_d19a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l380_c3_d19a_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l382_c32_c9ff]
signal BIN_OP_AND_uxn_opcodes_h_l382_c32_c9ff_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l382_c32_c9ff_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l382_c32_c9ff_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l382_c32_a956]
signal BIN_OP_GT_uxn_opcodes_h_l382_c32_a956_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l382_c32_a956_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l382_c32_a956_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l382_c32_43af]
signal MUX_uxn_opcodes_h_l382_c32_43af_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l382_c32_43af_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l382_c32_43af_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l382_c32_43af_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l384_c11_fcd5]
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l384_c7_0fc2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l384_c7_0fc2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_0fc2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l384_c7_0fc2]
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_0fc2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l390_c11_f60a]
signal BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l390_c7_fa59]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l390_c7_fa59]
signal result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l390_c7_fa59]
signal result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l390_c7_fa59]
signal result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l394_c11_dc49]
signal BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l394_c7_421f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l394_c7_421f]
signal result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l394_c7_421f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l394_c7_421f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l398_c11_b1db]
signal BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l398_c7_b9d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l398_c7_b9d1]
signal result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l398_c7_b9d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l398_c7_b9d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l400_c34_b4bb]
signal CONST_SR_8_uxn_opcodes_h_l400_c34_b4bb_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l400_c34_b4bb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l402_c11_f87f]
signal BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l402_c7_2c8d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l402_c7_2c8d]
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l402_c7_2c8d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l402_c7_2c8d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l406_c11_c35a]
signal BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l406_c7_6bf9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l406_c7_6bf9]
signal result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l406_c7_6bf9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l406_c7_6bf9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l410_c11_9e32]
signal BIN_OP_EQ_uxn_opcodes_h_l410_c11_9e32_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l410_c11_9e32_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l410_c11_9e32_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l410_c7_d8aa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l410_c7_d8aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_00e4
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_00e4_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_00e4_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_7ff1
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_7ff1_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_7ff1_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad
BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_left,
BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_right,
BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_return_output);

-- t16_MUX_uxn_opcodes_h_l348_c2_218d
t16_MUX_uxn_opcodes_h_l348_c2_218d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l348_c2_218d_cond,
t16_MUX_uxn_opcodes_h_l348_c2_218d_iftrue,
t16_MUX_uxn_opcodes_h_l348_c2_218d_iffalse,
t16_MUX_uxn_opcodes_h_l348_c2_218d_return_output);

-- n16_MUX_uxn_opcodes_h_l348_c2_218d
n16_MUX_uxn_opcodes_h_l348_c2_218d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l348_c2_218d_cond,
n16_MUX_uxn_opcodes_h_l348_c2_218d_iftrue,
n16_MUX_uxn_opcodes_h_l348_c2_218d_iffalse,
n16_MUX_uxn_opcodes_h_l348_c2_218d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d
result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d
result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d
result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d
result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_cond,
result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d
result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_return_output);

-- printf_uxn_opcodes_h_l349_c3_257e_uxn_opcodes_h_l349_c3_257e
printf_uxn_opcodes_h_l349_c3_257e_uxn_opcodes_h_l349_c3_257e : entity work.printf_uxn_opcodes_h_l349_c3_257e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l349_c3_257e_uxn_opcodes_h_l349_c3_257e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba
BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_left,
BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_right,
BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_return_output);

-- t16_MUX_uxn_opcodes_h_l353_c7_9e83
t16_MUX_uxn_opcodes_h_l353_c7_9e83 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l353_c7_9e83_cond,
t16_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue,
t16_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse,
t16_MUX_uxn_opcodes_h_l353_c7_9e83_return_output);

-- n16_MUX_uxn_opcodes_h_l353_c7_9e83
n16_MUX_uxn_opcodes_h_l353_c7_9e83 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l353_c7_9e83_cond,
n16_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue,
n16_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse,
n16_MUX_uxn_opcodes_h_l353_c7_9e83_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83
result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_cond,
result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9
BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_left,
BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_right,
BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_return_output);

-- t16_MUX_uxn_opcodes_h_l356_c7_4fe5
t16_MUX_uxn_opcodes_h_l356_c7_4fe5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l356_c7_4fe5_cond,
t16_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue,
t16_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse,
t16_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output);

-- n16_MUX_uxn_opcodes_h_l356_c7_4fe5
n16_MUX_uxn_opcodes_h_l356_c7_4fe5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l356_c7_4fe5_cond,
n16_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue,
n16_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse,
n16_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5
result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5
result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_cond,
result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da
BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_left,
BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_right,
BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_return_output);

-- t16_MUX_uxn_opcodes_h_l361_c7_6a27
t16_MUX_uxn_opcodes_h_l361_c7_6a27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l361_c7_6a27_cond,
t16_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue,
t16_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse,
t16_MUX_uxn_opcodes_h_l361_c7_6a27_return_output);

-- n16_MUX_uxn_opcodes_h_l361_c7_6a27
n16_MUX_uxn_opcodes_h_l361_c7_6a27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l361_c7_6a27_cond,
n16_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue,
n16_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse,
n16_MUX_uxn_opcodes_h_l361_c7_6a27_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27
result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_cond,
result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339
BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_left,
BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_right,
BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_return_output);

-- t16_MUX_uxn_opcodes_h_l364_c7_75c0
t16_MUX_uxn_opcodes_h_l364_c7_75c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l364_c7_75c0_cond,
t16_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue,
t16_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse,
t16_MUX_uxn_opcodes_h_l364_c7_75c0_return_output);

-- n16_MUX_uxn_opcodes_h_l364_c7_75c0
n16_MUX_uxn_opcodes_h_l364_c7_75c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l364_c7_75c0_cond,
n16_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue,
n16_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse,
n16_MUX_uxn_opcodes_h_l364_c7_75c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0
result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_cond,
result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l365_c3_ba48
BIN_OP_OR_uxn_opcodes_h_l365_c3_ba48 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l365_c3_ba48_left,
BIN_OP_OR_uxn_opcodes_h_l365_c3_ba48_right,
BIN_OP_OR_uxn_opcodes_h_l365_c3_ba48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188
BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_left,
BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_right,
BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_return_output);

-- n16_MUX_uxn_opcodes_h_l368_c7_e91e
n16_MUX_uxn_opcodes_h_l368_c7_e91e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l368_c7_e91e_cond,
n16_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue,
n16_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse,
n16_MUX_uxn_opcodes_h_l368_c7_e91e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e
result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_cond,
result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884
BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_left,
BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_right,
BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_return_output);

-- n16_MUX_uxn_opcodes_h_l371_c7_66ab
n16_MUX_uxn_opcodes_h_l371_c7_66ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l371_c7_66ab_cond,
n16_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue,
n16_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse,
n16_MUX_uxn_opcodes_h_l371_c7_66ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab
result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab
result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_cond,
result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c
BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_left,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_right,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_return_output);

-- n16_MUX_uxn_opcodes_h_l376_c7_4dfc
n16_MUX_uxn_opcodes_h_l376_c7_4dfc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l376_c7_4dfc_cond,
n16_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue,
n16_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse,
n16_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc
result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_cond,
result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe
BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_left,
BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_right,
BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_return_output);

-- n16_MUX_uxn_opcodes_h_l379_c7_a9a7
n16_MUX_uxn_opcodes_h_l379_c7_a9a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l379_c7_a9a7_cond,
n16_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue,
n16_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse,
n16_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7
result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7
result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_cond,
result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l380_c3_d19a
BIN_OP_OR_uxn_opcodes_h_l380_c3_d19a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l380_c3_d19a_left,
BIN_OP_OR_uxn_opcodes_h_l380_c3_d19a_right,
BIN_OP_OR_uxn_opcodes_h_l380_c3_d19a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l382_c32_c9ff
BIN_OP_AND_uxn_opcodes_h_l382_c32_c9ff : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l382_c32_c9ff_left,
BIN_OP_AND_uxn_opcodes_h_l382_c32_c9ff_right,
BIN_OP_AND_uxn_opcodes_h_l382_c32_c9ff_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l382_c32_a956
BIN_OP_GT_uxn_opcodes_h_l382_c32_a956 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l382_c32_a956_left,
BIN_OP_GT_uxn_opcodes_h_l382_c32_a956_right,
BIN_OP_GT_uxn_opcodes_h_l382_c32_a956_return_output);

-- MUX_uxn_opcodes_h_l382_c32_43af
MUX_uxn_opcodes_h_l382_c32_43af : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l382_c32_43af_cond,
MUX_uxn_opcodes_h_l382_c32_43af_iftrue,
MUX_uxn_opcodes_h_l382_c32_43af_iffalse,
MUX_uxn_opcodes_h_l382_c32_43af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5
BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_left,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_right,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2
result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_cond,
result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a
BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a_left,
BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a_right,
BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59
result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_cond,
result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59
result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59
result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49
BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49_left,
BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49_right,
BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f
result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_cond,
result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f
result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f
result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db
BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db_left,
BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db_right,
BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1
result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_cond,
result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1
result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1
result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l400_c34_b4bb
CONST_SR_8_uxn_opcodes_h_l400_c34_b4bb : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l400_c34_b4bb_x,
CONST_SR_8_uxn_opcodes_h_l400_c34_b4bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f
BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f_left,
BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f_right,
BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d
result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_cond,
result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a
BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a_left,
BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a_right,
BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9
result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_cond,
result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9
result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9
result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l410_c11_9e32
BIN_OP_EQ_uxn_opcodes_h_l410_c11_9e32 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l410_c11_9e32_left,
BIN_OP_EQ_uxn_opcodes_h_l410_c11_9e32_right,
BIN_OP_EQ_uxn_opcodes_h_l410_c11_9e32_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_00e4
CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_00e4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_00e4_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_00e4_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_7ff1
CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_7ff1 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_7ff1_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_7ff1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_return_output,
 t16_MUX_uxn_opcodes_h_l348_c2_218d_return_output,
 n16_MUX_uxn_opcodes_h_l348_c2_218d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_return_output,
 t16_MUX_uxn_opcodes_h_l353_c7_9e83_return_output,
 n16_MUX_uxn_opcodes_h_l353_c7_9e83_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_return_output,
 t16_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output,
 n16_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_return_output,
 t16_MUX_uxn_opcodes_h_l361_c7_6a27_return_output,
 n16_MUX_uxn_opcodes_h_l361_c7_6a27_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_return_output,
 t16_MUX_uxn_opcodes_h_l364_c7_75c0_return_output,
 n16_MUX_uxn_opcodes_h_l364_c7_75c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l365_c3_ba48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_return_output,
 n16_MUX_uxn_opcodes_h_l368_c7_e91e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_return_output,
 n16_MUX_uxn_opcodes_h_l371_c7_66ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_return_output,
 n16_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_return_output,
 n16_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l380_c3_d19a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l382_c32_c9ff_return_output,
 BIN_OP_GT_uxn_opcodes_h_l382_c32_a956_return_output,
 MUX_uxn_opcodes_h_l382_c32_43af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output,
 CONST_SR_8_uxn_opcodes_h_l400_c34_b4bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l410_c11_9e32_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_00e4_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_7ff1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l348_c2_218d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l348_c2_218d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e83_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l348_c2_218d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l348_c2_218d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l348_c2_218d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l348_c2_218d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e83_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l348_c2_218d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l348_c2_218d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l350_c3_0f87 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l349_c3_257e_uxn_opcodes_h_l349_c3_257e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e83_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e83_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_df3a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_6a27_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l356_c7_4fe5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_6a27_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l356_c7_4fe5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_1885 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l364_c7_75c0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_6a27_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l364_c7_75c0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_6a27_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l362_c3_d933 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l364_c7_75c0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_e91e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l364_c7_75c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_b7c7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ba48_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ba48_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ba48_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l371_c7_66ab_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_e91e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l369_c3_9359 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l371_c7_66ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l374_c3_1219 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_4dfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_399d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l379_c7_a9a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_d19a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_d19a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_d19a_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l382_c32_43af_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l382_c32_43af_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l382_c32_43af_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l382_c32_c9ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l382_c32_c9ff_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l382_c32_c9ff_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l382_c32_a956_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l382_c32_a956_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l382_c32_a956_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l382_c32_43af_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l387_c3_1890 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l391_c3_7f1e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l395_c3_26e2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l396_c24_5d83_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l399_c3_585e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l400_c34_b4bb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l400_c34_b4bb_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l400_c24_e619_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l403_c3_405c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l407_c3_fbbe : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_9e32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_9e32_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_9e32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l348_l371_l379_l398_l402_l410_l356_l376_l353_DUPLICATE_2dc2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l384_l356_l376_l353_DUPLICATE_1d88_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_1c04_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l361_l364_l406_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_122a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l371_l379_l398_l402_l410_l384_l356_l376_l353_DUPLICATE_c0ab_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l357_l372_l365_l380_DUPLICATE_73fc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_00e4_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_00e4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l379_l406_DUPLICATE_42a6_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l388_l404_DUPLICATE_017d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_7ff1_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_7ff1_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l408_l392_DUPLICATE_ca9f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l415_l344_DUPLICATE_d3ea_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l395_c3_26e2 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l395_c3_26e2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l369_c3_9359 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l369_c3_9359;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l382_c32_43af_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_df3a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_df3a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l391_c3_7f1e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l391_c3_7f1e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_1885 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_1885;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l374_c3_1219 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l374_c3_1219;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l399_c3_585e := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l399_c3_585e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l382_c32_43af_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l387_c3_1890 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l387_c3_1890;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l403_c3_405c := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l403_c3_405c;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_9e32_right := to_unsigned(15, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l382_c32_c9ff_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l362_c3_d933 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l362_c3_d933;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l350_c3_0f87 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l350_c3_0f87;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a_right := to_unsigned(14, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l407_c3_fbbe := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l407_c3_fbbe;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_b7c7 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_b7c7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_399d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_399d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f_right := to_unsigned(13, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l382_c32_a956_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l382_c32_c9ff_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_d19a_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_7ff1_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l348_c2_218d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_9e32_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ba48_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l400_c34_b4bb_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l348_c2_218d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse := t16;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l396_c24_5d83] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l396_c24_5d83_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l356_c11_86a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l364_c11_0339] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_left;
     BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_return_output := BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l368_c11_4188] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_left;
     BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_return_output := BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l410_c11_9e32] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l410_c11_9e32_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_9e32_left;
     BIN_OP_EQ_uxn_opcodes_h_l410_c11_9e32_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_9e32_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_9e32_return_output := BIN_OP_EQ_uxn_opcodes_h_l410_c11_9e32_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l371_l379_l398_l402_l410_l384_l356_l376_l353_DUPLICATE_c0ab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l371_l379_l398_l402_l410_l384_l356_l376_l353_DUPLICATE_c0ab_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l384_l356_l376_l353_DUPLICATE_1d88 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l384_l356_l376_l353_DUPLICATE_1d88_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l402_c11_f87f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f_left;
     BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f_return_output := BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l382_c32_c9ff] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l382_c32_c9ff_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l382_c32_c9ff_left;
     BIN_OP_AND_uxn_opcodes_h_l382_c32_c9ff_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l382_c32_c9ff_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l382_c32_c9ff_return_output := BIN_OP_AND_uxn_opcodes_h_l382_c32_c9ff_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_1c04 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_1c04_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l348_c6_d2ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l353_c11_aeba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_left;
     BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_return_output := BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l361_l364_l406_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_122a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l361_l364_l406_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_122a_return_output := result.stack_value;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_7ff1 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_7ff1_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_7ff1_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_7ff1_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_7ff1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l390_c11_f60a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a_left;
     BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a_return_output := BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l357_l372_l365_l380_DUPLICATE_73fc LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l357_l372_l365_l380_DUPLICATE_73fc_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l376_c11_3f5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_left;
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_return_output := BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l388_l404_DUPLICATE_017d LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l388_l404_DUPLICATE_017d_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l361_c11_12da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_left;
     BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_return_output := BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l398_c11_b1db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db_left;
     BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db_return_output := BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l379_l406_DUPLICATE_42a6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l379_l406_DUPLICATE_42a6_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l348_l371_l379_l398_l402_l410_l356_l376_l353_DUPLICATE_2dc2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l348_l371_l379_l398_l402_l410_l356_l376_l353_DUPLICATE_2dc2_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l394_c11_dc49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49_left;
     BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49_return_output := BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l371_c11_7884] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_left;
     BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_return_output := BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l379_c11_0dbe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_left;
     BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_return_output := BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l406_c11_c35a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a_left;
     BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a_return_output := BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l384_c11_fcd5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_left;
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_return_output := BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l400_c34_b4bb] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l400_c34_b4bb_x <= VAR_CONST_SR_8_uxn_opcodes_h_l400_c34_b4bb_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l400_c34_b4bb_return_output := CONST_SR_8_uxn_opcodes_h_l400_c34_b4bb_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l382_c32_a956_left := VAR_BIN_OP_AND_uxn_opcodes_h_l382_c32_c9ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l348_c2_218d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l348_c2_218d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_d2ad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_aeba_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l356_c7_4fe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l356_c7_4fe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_86a9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_6a27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_6a27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_12da_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l364_c7_75c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l364_c7_75c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_0339_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_e91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4188_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l371_c7_66ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7884_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_4dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f5c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l379_c7_a9a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_0dbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fcd5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_f60a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_dc49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_b1db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_f87f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_c35a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_9e32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_9e32_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ba48_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l357_l372_l365_l380_DUPLICATE_73fc_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_d19a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l357_l372_l365_l380_DUPLICATE_73fc_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_00e4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l357_l372_l365_l380_DUPLICATE_73fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l396_c24_5d83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l388_l404_DUPLICATE_017d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l388_l404_DUPLICATE_017d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_1c04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_1c04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_1c04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_1c04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_1c04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_1c04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_1c04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_1c04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_1c04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l371_l379_l398_l402_l410_l384_l356_l376_l353_DUPLICATE_c0ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l371_l379_l398_l402_l410_l384_l356_l376_l353_DUPLICATE_c0ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l371_l379_l398_l402_l410_l384_l356_l376_l353_DUPLICATE_c0ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l371_l379_l398_l402_l410_l384_l356_l376_l353_DUPLICATE_c0ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l371_l379_l398_l402_l410_l384_l356_l376_l353_DUPLICATE_c0ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l371_l379_l398_l402_l410_l384_l356_l376_l353_DUPLICATE_c0ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l371_l379_l398_l402_l410_l384_l356_l376_l353_DUPLICATE_c0ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l371_l379_l398_l402_l410_l384_l356_l376_l353_DUPLICATE_c0ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l371_l379_l398_l402_l410_l384_l356_l376_l353_DUPLICATE_c0ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l371_l379_l398_l402_l410_l384_l356_l376_l353_DUPLICATE_c0ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l371_l379_l398_l402_l410_l384_l356_l376_l353_DUPLICATE_c0ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l371_l379_l398_l402_l410_l384_l356_l376_l353_DUPLICATE_c0ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l371_l379_l398_l402_l410_l384_l356_l376_l353_DUPLICATE_c0ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l371_l379_l398_l402_l410_l384_l356_l376_l353_DUPLICATE_c0ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l371_l379_l398_l402_l410_l384_l356_l376_l353_DUPLICATE_c0ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l384_l356_l376_l353_DUPLICATE_1d88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l384_l356_l376_l353_DUPLICATE_1d88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l384_l356_l376_l353_DUPLICATE_1d88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l384_l356_l376_l353_DUPLICATE_1d88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l384_l356_l376_l353_DUPLICATE_1d88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l384_l356_l376_l353_DUPLICATE_1d88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l384_l356_l376_l353_DUPLICATE_1d88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l384_l356_l376_l353_DUPLICATE_1d88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l361_l364_l368_l348_l371_l384_l356_l376_l353_DUPLICATE_1d88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l348_l371_l379_l398_l402_l410_l356_l376_l353_DUPLICATE_2dc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l348_l371_l379_l398_l402_l410_l356_l376_l353_DUPLICATE_2dc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l348_l371_l379_l398_l402_l410_l356_l376_l353_DUPLICATE_2dc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l348_l371_l379_l398_l402_l410_l356_l376_l353_DUPLICATE_2dc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l348_l371_l379_l398_l402_l410_l356_l376_l353_DUPLICATE_2dc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l348_l371_l379_l398_l402_l410_l356_l376_l353_DUPLICATE_2dc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l348_l371_l379_l398_l402_l410_l356_l376_l353_DUPLICATE_2dc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l348_l371_l379_l398_l402_l410_l356_l376_l353_DUPLICATE_2dc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l348_l371_l379_l398_l402_l410_l356_l376_l353_DUPLICATE_2dc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l348_l371_l379_l398_l402_l410_l356_l376_l353_DUPLICATE_2dc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l348_l371_l379_l398_l402_l410_l356_l376_l353_DUPLICATE_2dc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l348_l371_l379_l398_l402_l410_l356_l376_l353_DUPLICATE_2dc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l348_l371_l379_l398_l402_l410_l356_l376_l353_DUPLICATE_2dc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l348_l371_l379_l398_l402_l410_l356_l376_l353_DUPLICATE_2dc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l361_l364_l390_l394_l406_l368_l348_l371_l379_l398_l402_l410_l356_l376_l353_DUPLICATE_2dc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l379_l406_DUPLICATE_42a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l379_l406_DUPLICATE_42a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l361_l364_l406_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_122a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l361_l364_l406_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_122a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l361_l364_l406_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_122a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l361_l364_l406_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_122a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l361_l364_l406_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_122a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l361_l364_l406_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_122a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l361_l364_l406_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_122a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l361_l364_l406_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_122a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l361_l364_l406_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_122a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l361_l364_l406_l368_l348_l371_l379_l356_l376_l353_DUPLICATE_122a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l410_c7_d8aa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l384_c7_0fc2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l382_c32_a956] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l382_c32_a956_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l382_c32_a956_left;
     BIN_OP_GT_uxn_opcodes_h_l382_c32_a956_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l382_c32_a956_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l382_c32_a956_return_output := BIN_OP_GT_uxn_opcodes_h_l382_c32_a956_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l410_c7_d8aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l348_c1_bfcf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l380_c3_d19a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l380_c3_d19a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_d19a_left;
     BIN_OP_OR_uxn_opcodes_h_l380_c3_d19a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_d19a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_d19a_return_output := BIN_OP_OR_uxn_opcodes_h_l380_c3_d19a_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_00e4 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_00e4_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_00e4_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_00e4_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_00e4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l365_c3_ba48] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l365_c3_ba48_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ba48_left;
     BIN_OP_OR_uxn_opcodes_h_l365_c3_ba48_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ba48_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ba48_return_output := BIN_OP_OR_uxn_opcodes_h_l365_c3_ba48_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l400_c24_e619] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l400_c24_e619_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l400_c34_b4bb_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l406_c7_6bf9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l408_l392_DUPLICATE_ca9f LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l408_l392_DUPLICATE_ca9f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_7ff1_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l382_c32_43af_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l382_c32_a956_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ba48_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_d19a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l400_c24_e619_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l408_l392_DUPLICATE_ca9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l408_l392_DUPLICATE_ca9f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_00e4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_00e4_return_output;
     VAR_printf_uxn_opcodes_h_l349_c3_257e_uxn_opcodes_h_l349_c3_257e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_bfcf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_d8aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_d8aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output;
     -- n16_MUX[uxn_opcodes_h_l379_c7_a9a7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l379_c7_a9a7_cond <= VAR_n16_MUX_uxn_opcodes_h_l379_c7_a9a7_cond;
     n16_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue;
     n16_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output := n16_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l406_c7_6bf9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output := result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output;

     -- MUX[uxn_opcodes_h_l382_c32_43af] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l382_c32_43af_cond <= VAR_MUX_uxn_opcodes_h_l382_c32_43af_cond;
     MUX_uxn_opcodes_h_l382_c32_43af_iftrue <= VAR_MUX_uxn_opcodes_h_l382_c32_43af_iftrue;
     MUX_uxn_opcodes_h_l382_c32_43af_iffalse <= VAR_MUX_uxn_opcodes_h_l382_c32_43af_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l382_c32_43af_return_output := MUX_uxn_opcodes_h_l382_c32_43af_return_output;

     -- printf_uxn_opcodes_h_l349_c3_257e[uxn_opcodes_h_l349_c3_257e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l349_c3_257e_uxn_opcodes_h_l349_c3_257e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l349_c3_257e_uxn_opcodes_h_l349_c3_257e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l364_c7_75c0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l364_c7_75c0_cond <= VAR_t16_MUX_uxn_opcodes_h_l364_c7_75c0_cond;
     t16_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue;
     t16_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l364_c7_75c0_return_output := t16_MUX_uxn_opcodes_h_l364_c7_75c0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l379_c7_a9a7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l406_c7_6bf9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l406_c7_6bf9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l402_c7_2c8d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue := VAR_MUX_uxn_opcodes_h_l382_c32_43af_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_6bf9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse := VAR_t16_MUX_uxn_opcodes_h_l364_c7_75c0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l379_c7_a9a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l402_c7_2c8d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l398_c7_b9d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l402_c7_2c8d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l402_c7_2c8d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output := result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output;

     -- n16_MUX[uxn_opcodes_h_l376_c7_4dfc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l376_c7_4dfc_cond <= VAR_n16_MUX_uxn_opcodes_h_l376_c7_4dfc_cond;
     n16_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue;
     n16_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output := n16_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output;

     -- t16_MUX[uxn_opcodes_h_l361_c7_6a27] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l361_c7_6a27_cond <= VAR_t16_MUX_uxn_opcodes_h_l361_c7_6a27_cond;
     t16_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue;
     t16_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_6a27_return_output := t16_MUX_uxn_opcodes_h_l361_c7_6a27_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l376_c7_4dfc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse := VAR_n16_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_2c8d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l361_c7_6a27_return_output;
     -- t16_MUX[uxn_opcodes_h_l356_c7_4fe5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l356_c7_4fe5_cond <= VAR_t16_MUX_uxn_opcodes_h_l356_c7_4fe5_cond;
     t16_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue;
     t16_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output := t16_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output;

     -- n16_MUX[uxn_opcodes_h_l371_c7_66ab] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l371_c7_66ab_cond <= VAR_n16_MUX_uxn_opcodes_h_l371_c7_66ab_cond;
     n16_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue;
     n16_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l371_c7_66ab_return_output := n16_MUX_uxn_opcodes_h_l371_c7_66ab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l398_c7_b9d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l394_c7_421f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l398_c7_b9d1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output := result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l371_c7_66ab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l376_c7_4dfc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l398_c7_b9d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l371_c7_66ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_66ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_421f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_b9d1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse := VAR_t16_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l394_c7_421f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_return_output := result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l368_c7_e91e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l390_c7_fa59] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l394_c7_421f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l371_c7_66ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_return_output;

     -- n16_MUX[uxn_opcodes_h_l368_c7_e91e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l368_c7_e91e_cond <= VAR_n16_MUX_uxn_opcodes_h_l368_c7_e91e_cond;
     n16_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue;
     n16_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_e91e_return_output := n16_MUX_uxn_opcodes_h_l368_c7_e91e_return_output;

     -- t16_MUX[uxn_opcodes_h_l353_c7_9e83] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l353_c7_9e83_cond <= VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e83_cond;
     t16_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue;
     t16_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e83_return_output := t16_MUX_uxn_opcodes_h_l353_c7_9e83_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l394_c7_421f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l368_c7_e91e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_421f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_e91e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_421f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_66ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_fa59_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_421f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l348_c2_218d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e83_return_output;
     -- n16_MUX[uxn_opcodes_h_l364_c7_75c0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l364_c7_75c0_cond <= VAR_n16_MUX_uxn_opcodes_h_l364_c7_75c0_cond;
     n16_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue;
     n16_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l364_c7_75c0_return_output := n16_MUX_uxn_opcodes_h_l364_c7_75c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l390_c7_fa59] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l390_c7_fa59] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_cond;
     result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_return_output := result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l364_c7_75c0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l368_c7_e91e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_return_output;

     -- t16_MUX[uxn_opcodes_h_l348_c2_218d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l348_c2_218d_cond <= VAR_t16_MUX_uxn_opcodes_h_l348_c2_218d_cond;
     t16_MUX_uxn_opcodes_h_l348_c2_218d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l348_c2_218d_iftrue;
     t16_MUX_uxn_opcodes_h_l348_c2_218d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l348_c2_218d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l348_c2_218d_return_output := t16_MUX_uxn_opcodes_h_l348_c2_218d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l390_c7_fa59] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_0fc2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse := VAR_n16_MUX_uxn_opcodes_h_l364_c7_75c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_fa59_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_75c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_fa59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_e91e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_fa59_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l348_c2_218d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l364_c7_75c0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_return_output;

     -- n16_MUX[uxn_opcodes_h_l361_c7_6a27] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l361_c7_6a27_cond <= VAR_n16_MUX_uxn_opcodes_h_l361_c7_6a27_cond;
     n16_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue;
     n16_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_6a27_return_output := n16_MUX_uxn_opcodes_h_l361_c7_6a27_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l384_c7_0fc2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output := result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l361_c7_6a27] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_0fc2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l379_c7_a9a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l384_c7_0fc2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l361_c7_6a27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6a27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_75c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_0fc2_return_output;
     -- n16_MUX[uxn_opcodes_h_l356_c7_4fe5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l356_c7_4fe5_cond <= VAR_n16_MUX_uxn_opcodes_h_l356_c7_4fe5_cond;
     n16_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue;
     n16_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output := n16_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_4dfc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l379_c7_a9a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l379_c7_a9a7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output := result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l379_c7_a9a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l356_c7_4fe5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l361_c7_6a27] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse := VAR_n16_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6a27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_a9a7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l371_c7_66ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l356_c7_4fe5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output;

     -- n16_MUX[uxn_opcodes_h_l353_c7_9e83] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l353_c7_9e83_cond <= VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e83_cond;
     n16_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue;
     n16_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e83_return_output := n16_MUX_uxn_opcodes_h_l353_c7_9e83_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l376_c7_4dfc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l353_c7_9e83] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l376_c7_4dfc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output := result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_4dfc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l348_c2_218d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_66ab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_4dfc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l371_c7_66ab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_return_output;

     -- n16_MUX[uxn_opcodes_h_l348_c2_218d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l348_c2_218d_cond <= VAR_n16_MUX_uxn_opcodes_h_l348_c2_218d_cond;
     n16_MUX_uxn_opcodes_h_l348_c2_218d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l348_c2_218d_iftrue;
     n16_MUX_uxn_opcodes_h_l348_c2_218d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l348_c2_218d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l348_c2_218d_return_output := n16_MUX_uxn_opcodes_h_l348_c2_218d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l371_c7_66ab] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_cond;
     result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_return_output := result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l371_c7_66ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l353_c7_9e83] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l368_c7_e91e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l348_c2_218d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l348_c2_218d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_66ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_66ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_e91e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_66ab_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l348_c2_218d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l368_c7_e91e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l368_c7_e91e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_return_output := result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l368_c7_e91e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l364_c7_75c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_e91e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_e91e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_75c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_e91e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l364_c7_75c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l364_c7_75c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l361_c7_6a27] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l364_c7_75c0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_return_output := result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_75c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_75c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6a27_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_75c0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l361_c7_6a27] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l361_c7_6a27] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l361_c7_6a27] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_cond;
     result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_return_output := result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l356_c7_4fe5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6a27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6a27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_6a27_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l356_c7_4fe5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l356_c7_4fe5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output := result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l356_c7_4fe5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l353_c7_9e83] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_return_output;

     -- Submodule level 15
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_4fe5_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l353_c7_9e83] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_cond;
     result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_return_output := result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l348_c2_218d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l353_c7_9e83] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l353_c7_9e83] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_9e83_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l348_c2_218d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_return_output := result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l348_c2_218d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l348_c2_218d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l415_l344_DUPLICATE_d3ea LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l415_l344_DUPLICATE_d3ea_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_218d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_218d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_218d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_218d_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_218d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_218d_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l415_l344_DUPLICATE_d3ea_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l415_l344_DUPLICATE_d3ea_return_output;
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
