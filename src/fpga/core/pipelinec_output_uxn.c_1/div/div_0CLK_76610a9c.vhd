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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 59
entity div_0CLK_76610a9c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div_0CLK_76610a9c;
architecture arch of div_0CLK_76610a9c is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2236_c6_d999]
signal BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2236_c2_19b7]
signal n8_MUX_uxn_opcodes_h_l2236_c2_19b7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2236_c2_19b7]
signal t8_MUX_uxn_opcodes_h_l2236_c2_19b7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2236_c2_19b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2236_c2_19b7]
signal result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2236_c2_19b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2236_c2_19b7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2236_c2_19b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2236_c2_19b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2241_c11_0d6b]
signal BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2241_c7_9b00]
signal n8_MUX_uxn_opcodes_h_l2241_c7_9b00_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2241_c7_9b00]
signal t8_MUX_uxn_opcodes_h_l2241_c7_9b00_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2241_c7_9b00]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2241_c7_9b00]
signal result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2241_c7_9b00]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2241_c7_9b00]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2241_c7_9b00]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2241_c7_9b00]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2244_c11_d007]
signal BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2244_c7_b1e0]
signal n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2244_c7_b1e0]
signal t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2244_c7_b1e0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2244_c7_b1e0]
signal result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2244_c7_b1e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2244_c7_b1e0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2244_c7_b1e0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2244_c7_b1e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2248_c11_9bf6]
signal BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2248_c7_d19d]
signal n8_MUX_uxn_opcodes_h_l2248_c7_d19d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2248_c7_d19d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2248_c7_d19d]
signal result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2248_c7_d19d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2248_c7_d19d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2248_c7_d19d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2248_c7_d19d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2251_c11_a08a]
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2251_c7_36e8]
signal n8_MUX_uxn_opcodes_h_l2251_c7_36e8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2251_c7_36e8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2251_c7_36e8]
signal result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2251_c7_36e8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2251_c7_36e8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2251_c7_36e8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2251_c7_36e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2254_c32_4d03]
signal BIN_OP_AND_uxn_opcodes_h_l2254_c32_4d03_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2254_c32_4d03_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2254_c32_4d03_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2254_c32_13a7]
signal BIN_OP_GT_uxn_opcodes_h_l2254_c32_13a7_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2254_c32_13a7_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2254_c32_13a7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2254_c32_1e51]
signal MUX_uxn_opcodes_h_l2254_c32_1e51_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2254_c32_1e51_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2254_c32_1e51_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2254_c32_1e51_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2256_c11_343e]
signal BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2256_c7_dbf2]
signal result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2256_c7_dbf2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2256_c7_dbf2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2256_c7_dbf2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2256_c7_dbf2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2260_c24_39db]
signal BIN_OP_EQ_uxn_opcodes_h_l2260_c24_39db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2260_c24_39db_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2260_c24_39db_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2260_c38_011c]
signal BIN_OP_DIV_uxn_opcodes_h_l2260_c38_011c_left : unsigned(7 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2260_c38_011c_right : unsigned(7 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2260_c38_011c_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l2260_c24_1df3]
signal MUX_uxn_opcodes_h_l2260_c24_1df3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2260_c24_1df3_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2260_c24_1df3_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2260_c24_1df3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2262_c11_7350]
signal BIN_OP_EQ_uxn_opcodes_h_l2262_c11_7350_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2262_c11_7350_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2262_c11_7350_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2262_c7_1c56]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2262_c7_1c56]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999
BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_left,
BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_right,
BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_return_output);

-- n8_MUX_uxn_opcodes_h_l2236_c2_19b7
n8_MUX_uxn_opcodes_h_l2236_c2_19b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2236_c2_19b7_cond,
n8_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue,
n8_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse,
n8_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output);

-- t8_MUX_uxn_opcodes_h_l2236_c2_19b7
t8_MUX_uxn_opcodes_h_l2236_c2_19b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2236_c2_19b7_cond,
t8_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue,
t8_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse,
t8_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7
result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7
result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b
BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_left,
BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_right,
BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_return_output);

-- n8_MUX_uxn_opcodes_h_l2241_c7_9b00
n8_MUX_uxn_opcodes_h_l2241_c7_9b00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2241_c7_9b00_cond,
n8_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue,
n8_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse,
n8_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output);

-- t8_MUX_uxn_opcodes_h_l2241_c7_9b00
t8_MUX_uxn_opcodes_h_l2241_c7_9b00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2241_c7_9b00_cond,
t8_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue,
t8_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse,
t8_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00
result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00
result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_cond,
result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00
result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00
result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00
result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_left,
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_right,
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_return_output);

-- n8_MUX_uxn_opcodes_h_l2244_c7_b1e0
n8_MUX_uxn_opcodes_h_l2244_c7_b1e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond,
n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue,
n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse,
n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output);

-- t8_MUX_uxn_opcodes_h_l2244_c7_b1e0
t8_MUX_uxn_opcodes_h_l2244_c7_b1e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond,
t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue,
t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse,
t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0
result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6
BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_left,
BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_right,
BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_return_output);

-- n8_MUX_uxn_opcodes_h_l2248_c7_d19d
n8_MUX_uxn_opcodes_h_l2248_c7_d19d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2248_c7_d19d_cond,
n8_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue,
n8_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse,
n8_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d
result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d
result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d
result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d
result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a
BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_left,
BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_right,
BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_return_output);

-- n8_MUX_uxn_opcodes_h_l2251_c7_36e8
n8_MUX_uxn_opcodes_h_l2251_c7_36e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2251_c7_36e8_cond,
n8_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue,
n8_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse,
n8_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8
result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8
result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2254_c32_4d03
BIN_OP_AND_uxn_opcodes_h_l2254_c32_4d03 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2254_c32_4d03_left,
BIN_OP_AND_uxn_opcodes_h_l2254_c32_4d03_right,
BIN_OP_AND_uxn_opcodes_h_l2254_c32_4d03_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2254_c32_13a7
BIN_OP_GT_uxn_opcodes_h_l2254_c32_13a7 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2254_c32_13a7_left,
BIN_OP_GT_uxn_opcodes_h_l2254_c32_13a7_right,
BIN_OP_GT_uxn_opcodes_h_l2254_c32_13a7_return_output);

-- MUX_uxn_opcodes_h_l2254_c32_1e51
MUX_uxn_opcodes_h_l2254_c32_1e51 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2254_c32_1e51_cond,
MUX_uxn_opcodes_h_l2254_c32_1e51_iftrue,
MUX_uxn_opcodes_h_l2254_c32_1e51_iffalse,
MUX_uxn_opcodes_h_l2254_c32_1e51_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e
BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_left,
BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_right,
BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2
result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2
result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2
result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2
result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2260_c24_39db
BIN_OP_EQ_uxn_opcodes_h_l2260_c24_39db : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2260_c24_39db_left,
BIN_OP_EQ_uxn_opcodes_h_l2260_c24_39db_right,
BIN_OP_EQ_uxn_opcodes_h_l2260_c24_39db_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2260_c38_011c
BIN_OP_DIV_uxn_opcodes_h_l2260_c38_011c : entity work.BIN_OP_DIV_uint8_t_uint8_t_0CLK_a148083c port map (
BIN_OP_DIV_uxn_opcodes_h_l2260_c38_011c_left,
BIN_OP_DIV_uxn_opcodes_h_l2260_c38_011c_right,
BIN_OP_DIV_uxn_opcodes_h_l2260_c38_011c_return_output);

-- MUX_uxn_opcodes_h_l2260_c24_1df3
MUX_uxn_opcodes_h_l2260_c24_1df3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2260_c24_1df3_cond,
MUX_uxn_opcodes_h_l2260_c24_1df3_iftrue,
MUX_uxn_opcodes_h_l2260_c24_1df3_iffalse,
MUX_uxn_opcodes_h_l2260_c24_1df3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2262_c11_7350
BIN_OP_EQ_uxn_opcodes_h_l2262_c11_7350 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2262_c11_7350_left,
BIN_OP_EQ_uxn_opcodes_h_l2262_c11_7350_right,
BIN_OP_EQ_uxn_opcodes_h_l2262_c11_7350_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56
result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56
result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_return_output,
 n8_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output,
 t8_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_return_output,
 n8_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output,
 t8_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_return_output,
 n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output,
 t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_return_output,
 n8_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_return_output,
 n8_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2254_c32_4d03_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2254_c32_13a7_return_output,
 MUX_uxn_opcodes_h_l2254_c32_1e51_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2260_c24_39db_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2260_c38_011c_return_output,
 MUX_uxn_opcodes_h_l2260_c24_1df3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2262_c11_7350_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2236_c2_19b7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2236_c2_19b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2238_c3_a10d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2241_c7_9b00_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2241_c7_9b00_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2242_c3_4c3f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2246_c3_af6e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2248_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2249_c3_0e4a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2251_c7_36e8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2254_c32_1e51_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2254_c32_1e51_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2254_c32_1e51_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2254_c32_4d03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2254_c32_4d03_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2254_c32_4d03_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2254_c32_13a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2254_c32_13a7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2254_c32_13a7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2254_c32_1e51_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2259_c3_bd54 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2260_c24_1df3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2260_c24_1df3_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2260_c24_1df3_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c24_39db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c24_39db_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c24_39db_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2260_c38_011c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2260_c38_011c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2260_c38_011c_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2260_c24_1df3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_7350_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_7350_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_7350_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2251_l2248_DUPLICATE_11c3_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2256_l2251_l2248_DUPLICATE_81cb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2256_l2248_DUPLICATE_106b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2262_l2251_l2248_DUPLICATE_b112_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2241_l2262_l2256_l2251_l2248_DUPLICATE_fa54_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2251_l2256_DUPLICATE_c3e1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2267_l2232_DUPLICATE_eed2_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2249_c3_0e4a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2249_c3_0e4a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2238_c3_a10d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2238_c3_a10d;
     VAR_MUX_uxn_opcodes_h_l2260_c24_1df3_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2254_c32_4d03_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c24_39db_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2259_c3_bd54 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2259_c3_bd54;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2246_c3_af6e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2246_c3_af6e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2242_c3_4c3f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2242_c3_4c3f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2254_c32_13a7_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l2254_c32_1e51_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_7350_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l2254_c32_1e51_iffalse := resize(to_signed(-1, 2), 8);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l2254_c32_4d03_left := VAR_ins;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2260_c38_011c_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_7350_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2260_c38_011c_right := t8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c24_39db_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2241_l2262_l2256_l2251_l2248_DUPLICATE_fa54 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2241_l2262_l2256_l2251_l2248_DUPLICATE_fa54_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2262_c11_7350] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2262_c11_7350_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_7350_left;
     BIN_OP_EQ_uxn_opcodes_h_l2262_c11_7350_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_7350_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_7350_return_output := BIN_OP_EQ_uxn_opcodes_h_l2262_c11_7350_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2256_l2251_l2248_DUPLICATE_81cb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2256_l2251_l2248_DUPLICATE_81cb_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2256_l2248_DUPLICATE_106b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2256_l2248_DUPLICATE_106b_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2244_c11_d007] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_left;
     BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_return_output := BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2251_c11_a08a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2236_c6_d999] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_left;
     BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_return_output := BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2256_c11_343e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2251_l2256_DUPLICATE_c3e1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2251_l2256_DUPLICATE_c3e1_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2251_l2248_DUPLICATE_11c3 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2251_l2248_DUPLICATE_11c3_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2260_c24_39db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2260_c24_39db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c24_39db_left;
     BIN_OP_EQ_uxn_opcodes_h_l2260_c24_39db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c24_39db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c24_39db_return_output := BIN_OP_EQ_uxn_opcodes_h_l2260_c24_39db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2241_c11_0d6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2248_c11_9bf6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2262_l2251_l2248_DUPLICATE_b112 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2262_l2251_l2248_DUPLICATE_b112_return_output := result.is_stack_write;

     -- BIN_OP_AND[uxn_opcodes_h_l2254_c32_4d03] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2254_c32_4d03_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2254_c32_4d03_left;
     BIN_OP_AND_uxn_opcodes_h_l2254_c32_4d03_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2254_c32_4d03_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2254_c32_4d03_return_output := BIN_OP_AND_uxn_opcodes_h_l2254_c32_4d03_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2260_c38_011c] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2260_c38_011c_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2260_c38_011c_left;
     BIN_OP_DIV_uxn_opcodes_h_l2260_c38_011c_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2260_c38_011c_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2260_c38_011c_return_output := BIN_OP_DIV_uxn_opcodes_h_l2260_c38_011c_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2254_c32_13a7_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2254_c32_4d03_return_output;
     VAR_MUX_uxn_opcodes_h_l2260_c24_1df3_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2260_c38_011c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2236_c2_19b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2236_c2_19b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_d999_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2241_c7_9b00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2241_c7_9b00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_0d6b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_d007_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2248_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_9bf6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2251_c7_36e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_a08a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_343e_return_output;
     VAR_MUX_uxn_opcodes_h_l2260_c24_1df3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c24_39db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_7350_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_7350_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2251_l2248_DUPLICATE_11c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2251_l2248_DUPLICATE_11c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2251_l2248_DUPLICATE_11c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2251_l2248_DUPLICATE_11c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2251_l2248_DUPLICATE_11c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2241_l2262_l2256_l2251_l2248_DUPLICATE_fa54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2241_l2262_l2256_l2251_l2248_DUPLICATE_fa54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2241_l2262_l2256_l2251_l2248_DUPLICATE_fa54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2241_l2262_l2256_l2251_l2248_DUPLICATE_fa54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2241_l2262_l2256_l2251_l2248_DUPLICATE_fa54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2241_l2262_l2256_l2251_l2248_DUPLICATE_fa54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2256_l2248_DUPLICATE_106b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2256_l2248_DUPLICATE_106b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2256_l2248_DUPLICATE_106b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2256_l2248_DUPLICATE_106b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2256_l2248_DUPLICATE_106b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2262_l2251_l2248_DUPLICATE_b112_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2262_l2251_l2248_DUPLICATE_b112_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2262_l2251_l2248_DUPLICATE_b112_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2262_l2251_l2248_DUPLICATE_b112_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2262_l2251_l2248_DUPLICATE_b112_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2262_l2251_l2248_DUPLICATE_b112_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2251_l2256_DUPLICATE_c3e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2251_l2256_DUPLICATE_c3e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2256_l2251_l2248_DUPLICATE_81cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2256_l2251_l2248_DUPLICATE_81cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2256_l2251_l2248_DUPLICATE_81cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2256_l2251_l2248_DUPLICATE_81cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2256_l2251_l2248_DUPLICATE_81cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2244_l2241_l2236_l2256_l2251_l2248_DUPLICATE_81cb_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2262_c7_1c56] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2256_c7_dbf2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output;

     -- MUX[uxn_opcodes_h_l2260_c24_1df3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2260_c24_1df3_cond <= VAR_MUX_uxn_opcodes_h_l2260_c24_1df3_cond;
     MUX_uxn_opcodes_h_l2260_c24_1df3_iftrue <= VAR_MUX_uxn_opcodes_h_l2260_c24_1df3_iftrue;
     MUX_uxn_opcodes_h_l2260_c24_1df3_iffalse <= VAR_MUX_uxn_opcodes_h_l2260_c24_1df3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2260_c24_1df3_return_output := MUX_uxn_opcodes_h_l2260_c24_1df3_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2254_c32_13a7] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2254_c32_13a7_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2254_c32_13a7_left;
     BIN_OP_GT_uxn_opcodes_h_l2254_c32_13a7_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2254_c32_13a7_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2254_c32_13a7_return_output := BIN_OP_GT_uxn_opcodes_h_l2254_c32_13a7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2256_c7_dbf2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output;

     -- t8_MUX[uxn_opcodes_h_l2244_c7_b1e0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond <= VAR_t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond;
     t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue;
     t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output := t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2262_c7_1c56] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_return_output;

     -- n8_MUX[uxn_opcodes_h_l2251_c7_36e8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2251_c7_36e8_cond <= VAR_n8_MUX_uxn_opcodes_h_l2251_c7_36e8_cond;
     n8_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue;
     n8_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output := n8_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2254_c32_1e51_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2254_c32_13a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue := VAR_MUX_uxn_opcodes_h_l2260_c24_1df3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_1c56_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_1c56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2256_c7_dbf2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2251_c7_36e8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output;

     -- n8_MUX[uxn_opcodes_h_l2248_c7_d19d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2248_c7_d19d_cond <= VAR_n8_MUX_uxn_opcodes_h_l2248_c7_d19d_cond;
     n8_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue;
     n8_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output := n8_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2256_c7_dbf2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output;

     -- t8_MUX[uxn_opcodes_h_l2241_c7_9b00] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2241_c7_9b00_cond <= VAR_t8_MUX_uxn_opcodes_h_l2241_c7_9b00_cond;
     t8_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue;
     t8_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output := t8_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2256_c7_dbf2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2251_c7_36e8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output;

     -- MUX[uxn_opcodes_h_l2254_c32_1e51] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2254_c32_1e51_cond <= VAR_MUX_uxn_opcodes_h_l2254_c32_1e51_cond;
     MUX_uxn_opcodes_h_l2254_c32_1e51_iftrue <= VAR_MUX_uxn_opcodes_h_l2254_c32_1e51_iftrue;
     MUX_uxn_opcodes_h_l2254_c32_1e51_iffalse <= VAR_MUX_uxn_opcodes_h_l2254_c32_1e51_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2254_c32_1e51_return_output := MUX_uxn_opcodes_h_l2254_c32_1e51_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue := VAR_MUX_uxn_opcodes_h_l2254_c32_1e51_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_dbf2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2248_c7_d19d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2251_c7_36e8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2251_c7_36e8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output;

     -- t8_MUX[uxn_opcodes_h_l2236_c2_19b7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2236_c2_19b7_cond <= VAR_t8_MUX_uxn_opcodes_h_l2236_c2_19b7_cond;
     t8_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue;
     t8_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output := t8_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output;

     -- n8_MUX[uxn_opcodes_h_l2244_c7_b1e0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond <= VAR_n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond;
     n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue;
     n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output := n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2251_c7_36e8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2251_c7_36e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2248_c7_d19d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_36e8_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2248_c7_d19d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2248_c7_d19d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2248_c7_d19d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2241_c7_9b00] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2241_c7_9b00_cond <= VAR_n8_MUX_uxn_opcodes_h_l2241_c7_9b00_cond;
     n8_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue;
     n8_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output := n8_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2248_c7_d19d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2244_c7_b1e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2244_c7_b1e0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_d19d_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2244_c7_b1e0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2241_c7_9b00] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2244_c7_b1e0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2244_c7_b1e0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2244_c7_b1e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2241_c7_9b00] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output;

     -- n8_MUX[uxn_opcodes_h_l2236_c2_19b7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2236_c2_19b7_cond <= VAR_n8_MUX_uxn_opcodes_h_l2236_c2_19b7_cond;
     n8_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue;
     n8_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output := n8_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_b1e0_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2236_c2_19b7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2241_c7_9b00] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output := result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2236_c2_19b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2241_c7_9b00] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2241_c7_9b00] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2241_c7_9b00] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_9b00_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2236_c2_19b7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2236_c2_19b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2236_c2_19b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2236_c2_19b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2267_l2232_DUPLICATE_eed2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2267_l2232_DUPLICATE_eed2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_19b7_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2267_l2232_DUPLICATE_eed2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2267_l2232_DUPLICATE_eed2_return_output;
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
