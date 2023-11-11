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
-- Submodules: 66
entity lth2_0CLK_302e9520 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_302e9520;
architecture arch of lth2_0CLK_302e9520 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1832_c6_1f9a]
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1832_c1_e4cb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1832_c2_b1e2]
signal n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1832_c2_b1e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1832_c2_b1e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1832_c2_b1e2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1832_c2_b1e2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1832_c2_b1e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1832_c2_b1e2]
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1832_c2_b1e2]
signal t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1833_c3_ed8e[uxn_opcodes_h_l1833_c3_ed8e]
signal printf_uxn_opcodes_h_l1833_c3_ed8e_uxn_opcodes_h_l1833_c3_ed8e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1837_c11_624c]
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1837_c7_d7f7]
signal n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1837_c7_d7f7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1837_c7_d7f7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1837_c7_d7f7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1837_c7_d7f7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1837_c7_d7f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1837_c7_d7f7]
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1837_c7_d7f7]
signal t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1840_c11_4986]
signal BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1840_c7_fa07]
signal n16_MUX_uxn_opcodes_h_l1840_c7_fa07_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1840_c7_fa07]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1840_c7_fa07]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1840_c7_fa07]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1840_c7_fa07]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1840_c7_fa07]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1840_c7_fa07]
signal result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1840_c7_fa07]
signal t16_MUX_uxn_opcodes_h_l1840_c7_fa07_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1845_c11_30e3]
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1845_c7_3f97]
signal n16_MUX_uxn_opcodes_h_l1845_c7_3f97_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1845_c7_3f97]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1845_c7_3f97]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1845_c7_3f97]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1845_c7_3f97]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1845_c7_3f97]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1845_c7_3f97]
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1845_c7_3f97]
signal t16_MUX_uxn_opcodes_h_l1845_c7_3f97_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1846_c3_916c]
signal BIN_OP_OR_uxn_opcodes_h_l1846_c3_916c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1846_c3_916c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1846_c3_916c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1849_c11_4a37]
signal BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1849_c7_b675]
signal n16_MUX_uxn_opcodes_h_l1849_c7_b675_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1849_c7_b675_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1849_c7_b675]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1849_c7_b675]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1849_c7_b675]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1849_c7_b675]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1849_c7_b675]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1849_c7_b675]
signal result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1853_c11_7f2f]
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1853_c7_34c7]
signal n16_MUX_uxn_opcodes_h_l1853_c7_34c7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1853_c7_34c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1853_c7_34c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1853_c7_34c7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1853_c7_34c7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1853_c7_34c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1853_c7_34c7]
signal result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1854_c3_b146]
signal BIN_OP_OR_uxn_opcodes_h_l1854_c3_b146_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1854_c3_b146_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1854_c3_b146_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1856_c30_00b7]
signal sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1859_c21_95d4]
signal BIN_OP_LT_uxn_opcodes_h_l1859_c21_95d4_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1859_c21_95d4_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1859_c21_95d4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1859_c21_1ed5]
signal MUX_uxn_opcodes_h_l1859_c21_1ed5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1859_c21_1ed5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1859_c21_1ed5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1859_c21_1ed5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1861_c11_6785]
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1861_c7_6459]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1861_c7_6459]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1861_c7_6459]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_ba7c
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_ba7c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_ba7c_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_4e73( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a
BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_left,
BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_right,
BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_return_output);

-- n16_MUX_uxn_opcodes_h_l1832_c2_b1e2
n16_MUX_uxn_opcodes_h_l1832_c2_b1e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond,
n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue,
n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse,
n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2
result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output);

-- t16_MUX_uxn_opcodes_h_l1832_c2_b1e2
t16_MUX_uxn_opcodes_h_l1832_c2_b1e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond,
t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue,
t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse,
t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output);

-- printf_uxn_opcodes_h_l1833_c3_ed8e_uxn_opcodes_h_l1833_c3_ed8e
printf_uxn_opcodes_h_l1833_c3_ed8e_uxn_opcodes_h_l1833_c3_ed8e : entity work.printf_uxn_opcodes_h_l1833_c3_ed8e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1833_c3_ed8e_uxn_opcodes_h_l1833_c3_ed8e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_left,
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_right,
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_return_output);

-- n16_MUX_uxn_opcodes_h_l1837_c7_d7f7
n16_MUX_uxn_opcodes_h_l1837_c7_d7f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond,
n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue,
n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse,
n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output);

-- t16_MUX_uxn_opcodes_h_l1837_c7_d7f7
t16_MUX_uxn_opcodes_h_l1837_c7_d7f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond,
t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue,
t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse,
t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_left,
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_right,
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_return_output);

-- n16_MUX_uxn_opcodes_h_l1840_c7_fa07
n16_MUX_uxn_opcodes_h_l1840_c7_fa07 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1840_c7_fa07_cond,
n16_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue,
n16_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse,
n16_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_cond,
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output);

-- t16_MUX_uxn_opcodes_h_l1840_c7_fa07
t16_MUX_uxn_opcodes_h_l1840_c7_fa07 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1840_c7_fa07_cond,
t16_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue,
t16_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse,
t16_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_left,
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_right,
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_return_output);

-- n16_MUX_uxn_opcodes_h_l1845_c7_3f97
n16_MUX_uxn_opcodes_h_l1845_c7_3f97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1845_c7_3f97_cond,
n16_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue,
n16_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse,
n16_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_cond,
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output);

-- t16_MUX_uxn_opcodes_h_l1845_c7_3f97
t16_MUX_uxn_opcodes_h_l1845_c7_3f97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1845_c7_3f97_cond,
t16_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue,
t16_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse,
t16_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1846_c3_916c
BIN_OP_OR_uxn_opcodes_h_l1846_c3_916c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1846_c3_916c_left,
BIN_OP_OR_uxn_opcodes_h_l1846_c3_916c_right,
BIN_OP_OR_uxn_opcodes_h_l1846_c3_916c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_left,
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_right,
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_return_output);

-- n16_MUX_uxn_opcodes_h_l1849_c7_b675
n16_MUX_uxn_opcodes_h_l1849_c7_b675 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1849_c7_b675_cond,
n16_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue,
n16_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse,
n16_MUX_uxn_opcodes_h_l1849_c7_b675_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675
result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_cond,
result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_left,
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_right,
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_return_output);

-- n16_MUX_uxn_opcodes_h_l1853_c7_34c7
n16_MUX_uxn_opcodes_h_l1853_c7_34c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1853_c7_34c7_cond,
n16_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue,
n16_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse,
n16_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7
result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1854_c3_b146
BIN_OP_OR_uxn_opcodes_h_l1854_c3_b146 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1854_c3_b146_left,
BIN_OP_OR_uxn_opcodes_h_l1854_c3_b146_right,
BIN_OP_OR_uxn_opcodes_h_l1854_c3_b146_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7
sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_ins,
sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_x,
sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_y,
sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1859_c21_95d4
BIN_OP_LT_uxn_opcodes_h_l1859_c21_95d4 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1859_c21_95d4_left,
BIN_OP_LT_uxn_opcodes_h_l1859_c21_95d4_right,
BIN_OP_LT_uxn_opcodes_h_l1859_c21_95d4_return_output);

-- MUX_uxn_opcodes_h_l1859_c21_1ed5
MUX_uxn_opcodes_h_l1859_c21_1ed5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1859_c21_1ed5_cond,
MUX_uxn_opcodes_h_l1859_c21_1ed5_iftrue,
MUX_uxn_opcodes_h_l1859_c21_1ed5_iffalse,
MUX_uxn_opcodes_h_l1859_c21_1ed5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785_left,
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785_right,
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459
result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_ba7c
CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_ba7c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_ba7c_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_ba7c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_return_output,
 n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output,
 t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_return_output,
 n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output,
 t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_return_output,
 n16_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output,
 t16_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_return_output,
 n16_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output,
 t16_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1846_c3_916c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_return_output,
 n16_MUX_uxn_opcodes_h_l1849_c7_b675_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_return_output,
 n16_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1854_c3_b146_return_output,
 sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1859_c21_95d4_return_output,
 MUX_uxn_opcodes_h_l1859_c21_1ed5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_ba7c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1834_c3_ffe6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1833_c3_ed8e_uxn_opcodes_h_l1833_c3_ed8e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1838_c3_caf0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1840_c7_fa07_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1843_c3_7e28 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1840_c7_fa07_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1849_c7_b675_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c7_3f97_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1847_c3_3e6d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c7_3f97_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_916c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_916c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_916c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1849_c7_b675_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1853_c7_34c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_9baa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_b146_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_b146_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_b146_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1859_c21_1ed5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1859_c21_1ed5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1859_c21_1ed5_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_95d4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_95d4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_95d4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1859_c21_1ed5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1861_l1849_DUPLICATE_4d14_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1861_l1849_DUPLICATE_41c0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1853_l1849_DUPLICATE_df7b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1853_l1849_DUPLICATE_558b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1861_l1853_l1849_DUPLICATE_a028_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1841_l1850_l1854_l1846_DUPLICATE_6778_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_ba7c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_ba7c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1849_l1853_DUPLICATE_bb09_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1867_l1828_DUPLICATE_0d4e_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_y := resize(to_signed(-3, 3), 4);
     VAR_MUX_uxn_opcodes_h_l1859_c21_1ed5_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1838_c3_caf0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1838_c3_caf0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_9baa := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_9baa;
     VAR_MUX_uxn_opcodes_h_l1859_c21_1ed5_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1834_c3_ffe6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1834_c3_ffe6;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1843_c3_7e28 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1843_c3_7e28;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1847_c3_3e6d := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1847_c3_3e6d;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_b146_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_95d4_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_916c_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1837_c11_624c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1853_c11_7f2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1861_l1849_DUPLICATE_4d14 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1861_l1849_DUPLICATE_4d14_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1861_l1849_DUPLICATE_41c0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1861_l1849_DUPLICATE_41c0_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1849_l1853_DUPLICATE_bb09 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1849_l1853_DUPLICATE_bb09_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1845_c11_30e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1853_l1849_DUPLICATE_558b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1853_l1849_DUPLICATE_558b_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1849_c11_4a37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_left;
     BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_return_output := BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1832_c6_1f9a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1856_c30_00b7] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_ins;
     sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_x;
     sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_return_output := sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1861_l1853_l1849_DUPLICATE_a028 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1861_l1853_l1849_DUPLICATE_a028_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1841_l1850_l1854_l1846_DUPLICATE_6778 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1841_l1850_l1854_l1846_DUPLICATE_6778_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1861_c11_6785] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785_left;
     BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785_return_output := BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1853_l1849_DUPLICATE_df7b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1853_l1849_DUPLICATE_df7b_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1840_c11_4986] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_left;
     BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_return_output := BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_1f9a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_624c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1840_c7_fa07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1840_c7_fa07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_4986_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1845_c7_3f97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1845_c7_3f97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_30e3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1849_c7_b675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_4a37_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1853_c7_34c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_7f2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_6785_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_916c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1841_l1850_l1854_l1846_DUPLICATE_6778_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_b146_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1841_l1850_l1854_l1846_DUPLICATE_6778_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_ba7c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1841_l1850_l1854_l1846_DUPLICATE_6778_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1853_l1849_DUPLICATE_df7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1853_l1849_DUPLICATE_df7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1853_l1849_DUPLICATE_df7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1853_l1849_DUPLICATE_df7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1853_l1849_DUPLICATE_df7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1853_l1849_DUPLICATE_df7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1861_l1853_l1849_DUPLICATE_a028_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1861_l1853_l1849_DUPLICATE_a028_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1861_l1853_l1849_DUPLICATE_a028_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1861_l1853_l1849_DUPLICATE_a028_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1861_l1853_l1849_DUPLICATE_a028_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1861_l1853_l1849_DUPLICATE_a028_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1861_l1849_DUPLICATE_41c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1861_l1849_DUPLICATE_41c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1861_l1849_DUPLICATE_41c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1861_l1849_DUPLICATE_41c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1861_l1849_DUPLICATE_41c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1861_l1849_DUPLICATE_41c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1861_l1849_DUPLICATE_4d14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1861_l1849_DUPLICATE_4d14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1861_l1849_DUPLICATE_4d14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1861_l1849_DUPLICATE_4d14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1861_l1849_DUPLICATE_4d14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1861_l1849_DUPLICATE_4d14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1849_l1853_DUPLICATE_bb09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1849_l1853_DUPLICATE_bb09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1853_l1849_DUPLICATE_558b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1853_l1849_DUPLICATE_558b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1853_l1849_DUPLICATE_558b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1853_l1849_DUPLICATE_558b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1853_l1849_DUPLICATE_558b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1845_l1840_l1837_l1832_l1853_l1849_DUPLICATE_558b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_00b7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1832_c1_e4cb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1853_c7_34c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1846_c3_916c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1846_c3_916c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_916c_left;
     BIN_OP_OR_uxn_opcodes_h_l1846_c3_916c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_916c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_916c_return_output := BIN_OP_OR_uxn_opcodes_h_l1846_c3_916c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1861_c7_6459] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1861_c7_6459] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1854_c3_b146] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1854_c3_b146_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_b146_left;
     BIN_OP_OR_uxn_opcodes_h_l1854_c3_b146_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_b146_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_b146_return_output := BIN_OP_OR_uxn_opcodes_h_l1854_c3_b146_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1861_c7_6459] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1853_c7_34c7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_ba7c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_ba7c_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_ba7c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_ba7c_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_ba7c_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_916c_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_95d4_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_b146_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_b146_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_ba7c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_ba7c_return_output;
     VAR_printf_uxn_opcodes_h_l1833_c3_ed8e_uxn_opcodes_h_l1833_c3_ed8e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_e4cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_6459_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_6459_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_6459_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output;
     -- t16_MUX[uxn_opcodes_h_l1845_c7_3f97] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1845_c7_3f97_cond <= VAR_t16_MUX_uxn_opcodes_h_l1845_c7_3f97_cond;
     t16_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue;
     t16_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output := t16_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output;

     -- n16_MUX[uxn_opcodes_h_l1853_c7_34c7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1853_c7_34c7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1853_c7_34c7_cond;
     n16_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue;
     n16_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output := n16_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1853_c7_34c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1853_c7_34c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1853_c7_34c7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1859_c21_95d4] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1859_c21_95d4_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_95d4_left;
     BIN_OP_LT_uxn_opcodes_h_l1859_c21_95d4_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_95d4_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_95d4_return_output := BIN_OP_LT_uxn_opcodes_h_l1859_c21_95d4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1849_c7_b675] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1849_c7_b675] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_return_output;

     -- printf_uxn_opcodes_h_l1833_c3_ed8e[uxn_opcodes_h_l1833_c3_ed8e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1833_c3_ed8e_uxn_opcodes_h_l1833_c3_ed8e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1833_c3_ed8e_uxn_opcodes_h_l1833_c3_ed8e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1859_c21_1ed5_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_95d4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_b675_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_b675_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1849_c7_b675] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_return_output;

     -- n16_MUX[uxn_opcodes_h_l1849_c7_b675] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1849_c7_b675_cond <= VAR_n16_MUX_uxn_opcodes_h_l1849_c7_b675_cond;
     n16_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue;
     n16_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1849_c7_b675_return_output := n16_MUX_uxn_opcodes_h_l1849_c7_b675_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1849_c7_b675] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1845_c7_3f97] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output;

     -- MUX[uxn_opcodes_h_l1859_c21_1ed5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1859_c21_1ed5_cond <= VAR_MUX_uxn_opcodes_h_l1859_c21_1ed5_cond;
     MUX_uxn_opcodes_h_l1859_c21_1ed5_iftrue <= VAR_MUX_uxn_opcodes_h_l1859_c21_1ed5_iftrue;
     MUX_uxn_opcodes_h_l1859_c21_1ed5_iffalse <= VAR_MUX_uxn_opcodes_h_l1859_c21_1ed5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1859_c21_1ed5_return_output := MUX_uxn_opcodes_h_l1859_c21_1ed5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1849_c7_b675] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1845_c7_3f97] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output;

     -- t16_MUX[uxn_opcodes_h_l1840_c7_fa07] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1840_c7_fa07_cond <= VAR_t16_MUX_uxn_opcodes_h_l1840_c7_fa07_cond;
     t16_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue;
     t16_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output := t16_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue := VAR_MUX_uxn_opcodes_h_l1859_c21_1ed5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1849_c7_b675_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_b675_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_b675_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_b675_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output;
     -- t16_MUX[uxn_opcodes_h_l1837_c7_d7f7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond;
     t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue;
     t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output := t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1840_c7_fa07] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1845_c7_3f97] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1853_c7_34c7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1845_c7_3f97] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output;

     -- n16_MUX[uxn_opcodes_h_l1845_c7_3f97] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1845_c7_3f97_cond <= VAR_n16_MUX_uxn_opcodes_h_l1845_c7_3f97_cond;
     n16_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue;
     n16_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output := n16_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1840_c7_fa07] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1845_c7_3f97] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_34c7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1840_c7_fa07] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1837_c7_d7f7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1840_c7_fa07] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output;

     -- t16_MUX[uxn_opcodes_h_l1832_c2_b1e2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond;
     t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue;
     t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output := t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1849_c7_b675] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_return_output := result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1840_c7_fa07] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1837_c7_d7f7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1840_c7_fa07] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1840_c7_fa07_cond <= VAR_n16_MUX_uxn_opcodes_h_l1840_c7_fa07_cond;
     n16_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue;
     n16_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output := n16_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_b675_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output;
     -- n16_MUX[uxn_opcodes_h_l1837_c7_d7f7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond;
     n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue;
     n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output := n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1837_c7_d7f7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1845_c7_3f97] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output := result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1832_c2_b1e2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1837_c7_d7f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1832_c2_b1e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1837_c7_d7f7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_3f97_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1832_c2_b1e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1832_c2_b1e2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1832_c2_b1e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1832_c2_b1e2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond;
     n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue;
     n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output := n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1840_c7_fa07] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output := result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_fa07_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1837_c7_d7f7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_d7f7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1832_c2_b1e2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1867_l1828_DUPLICATE_0d4e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1867_l1828_DUPLICATE_0d4e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4e73(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_b1e2_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1867_l1828_DUPLICATE_0d4e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1867_l1828_DUPLICATE_0d4e_return_output;
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
