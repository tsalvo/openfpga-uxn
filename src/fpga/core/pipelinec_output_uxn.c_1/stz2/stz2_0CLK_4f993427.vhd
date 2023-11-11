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
-- Submodules: 68
entity stz2_0CLK_4f993427 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz2_0CLK_4f993427;
architecture arch of stz2_0CLK_4f993427 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1483_c6_0b81]
signal BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1483_c1_f1ab]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1483_c2_0e50]
signal n16_MUX_uxn_opcodes_h_l1483_c2_0e50_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1483_c2_0e50]
signal t8_MUX_uxn_opcodes_h_l1483_c2_0e50_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1483_c2_0e50]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1483_c2_0e50]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1483_c2_0e50]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1483_c2_0e50]
signal result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1483_c2_0e50]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1483_c2_0e50]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1483_c2_0e50]
signal result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1484_c3_73f6[uxn_opcodes_h_l1484_c3_73f6]
signal printf_uxn_opcodes_h_l1484_c3_73f6_uxn_opcodes_h_l1484_c3_73f6_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1488_c11_452b]
signal BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1488_c7_000c]
signal n16_MUX_uxn_opcodes_h_l1488_c7_000c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1488_c7_000c_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1488_c7_000c]
signal t8_MUX_uxn_opcodes_h_l1488_c7_000c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1488_c7_000c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1488_c7_000c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1488_c7_000c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1488_c7_000c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1488_c7_000c]
signal result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1488_c7_000c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1488_c7_000c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1488_c7_000c]
signal result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1491_c11_3f13]
signal BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1491_c7_fb80]
signal n16_MUX_uxn_opcodes_h_l1491_c7_fb80_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1491_c7_fb80]
signal t8_MUX_uxn_opcodes_h_l1491_c7_fb80_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1491_c7_fb80]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1491_c7_fb80]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1491_c7_fb80]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1491_c7_fb80]
signal result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1491_c7_fb80]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1491_c7_fb80]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1491_c7_fb80]
signal result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1495_c11_81ac]
signal BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1495_c7_be43]
signal n16_MUX_uxn_opcodes_h_l1495_c7_be43_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1495_c7_be43_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1495_c7_be43]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1495_c7_be43]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1495_c7_be43]
signal result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1495_c7_be43]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1495_c7_be43]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1495_c7_be43]
signal result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1497_c3_e9d4]
signal CONST_SL_8_uxn_opcodes_h_l1497_c3_e9d4_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1497_c3_e9d4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1499_c11_0547]
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1499_c7_1f55]
signal n16_MUX_uxn_opcodes_h_l1499_c7_1f55_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1499_c7_1f55]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1499_c7_1f55]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1499_c7_1f55]
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1499_c7_1f55]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1499_c7_1f55]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1499_c7_1f55]
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1500_c3_b82c]
signal BIN_OP_OR_uxn_opcodes_h_l1500_c3_b82c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1500_c3_b82c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1500_c3_b82c_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1502_c30_7749]
signal sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1505_c31_76b4]
signal CONST_SR_8_uxn_opcodes_h_l1505_c31_76b4_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1505_c31_76b4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_7845]
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_5de9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1507_c7_5de9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1507_c7_5de9]
signal result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1507_c7_5de9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1507_c7_5de9]
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1509_c33_e1e8]
signal BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_e1e8_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_e1e8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_e1e8_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1512_c11_ec05]
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_ec05_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_ec05_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_ec05_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1512_c7_153d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1512_c7_153d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_return_output : unsigned(0 downto 0);

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

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_ed17( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81
BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_left,
BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_right,
BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_return_output);

-- n16_MUX_uxn_opcodes_h_l1483_c2_0e50
n16_MUX_uxn_opcodes_h_l1483_c2_0e50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1483_c2_0e50_cond,
n16_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue,
n16_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse,
n16_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output);

-- t8_MUX_uxn_opcodes_h_l1483_c2_0e50
t8_MUX_uxn_opcodes_h_l1483_c2_0e50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1483_c2_0e50_cond,
t8_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue,
t8_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse,
t8_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50
result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_cond,
result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50
result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_cond,
result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output);

-- printf_uxn_opcodes_h_l1484_c3_73f6_uxn_opcodes_h_l1484_c3_73f6
printf_uxn_opcodes_h_l1484_c3_73f6_uxn_opcodes_h_l1484_c3_73f6 : entity work.printf_uxn_opcodes_h_l1484_c3_73f6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1484_c3_73f6_uxn_opcodes_h_l1484_c3_73f6_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b
BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_left,
BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_right,
BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_return_output);

-- n16_MUX_uxn_opcodes_h_l1488_c7_000c
n16_MUX_uxn_opcodes_h_l1488_c7_000c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1488_c7_000c_cond,
n16_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue,
n16_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse,
n16_MUX_uxn_opcodes_h_l1488_c7_000c_return_output);

-- t8_MUX_uxn_opcodes_h_l1488_c7_000c
t8_MUX_uxn_opcodes_h_l1488_c7_000c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1488_c7_000c_cond,
t8_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue,
t8_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse,
t8_MUX_uxn_opcodes_h_l1488_c7_000c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c
result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c
result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c
result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13
BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_left,
BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_right,
BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_return_output);

-- n16_MUX_uxn_opcodes_h_l1491_c7_fb80
n16_MUX_uxn_opcodes_h_l1491_c7_fb80 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1491_c7_fb80_cond,
n16_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue,
n16_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse,
n16_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output);

-- t8_MUX_uxn_opcodes_h_l1491_c7_fb80
t8_MUX_uxn_opcodes_h_l1491_c7_fb80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1491_c7_fb80_cond,
t8_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue,
t8_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse,
t8_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_cond,
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_cond,
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_left,
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_right,
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_return_output);

-- n16_MUX_uxn_opcodes_h_l1495_c7_be43
n16_MUX_uxn_opcodes_h_l1495_c7_be43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1495_c7_be43_cond,
n16_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue,
n16_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse,
n16_MUX_uxn_opcodes_h_l1495_c7_be43_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43
result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_cond,
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_cond,
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1497_c3_e9d4
CONST_SL_8_uxn_opcodes_h_l1497_c3_e9d4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1497_c3_e9d4_x,
CONST_SL_8_uxn_opcodes_h_l1497_c3_e9d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_left,
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_right,
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_return_output);

-- n16_MUX_uxn_opcodes_h_l1499_c7_1f55
n16_MUX_uxn_opcodes_h_l1499_c7_1f55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1499_c7_1f55_cond,
n16_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue,
n16_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse,
n16_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_cond,
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_cond,
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1500_c3_b82c
BIN_OP_OR_uxn_opcodes_h_l1500_c3_b82c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1500_c3_b82c_left,
BIN_OP_OR_uxn_opcodes_h_l1500_c3_b82c_right,
BIN_OP_OR_uxn_opcodes_h_l1500_c3_b82c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1502_c30_7749
sp_relative_shift_uxn_opcodes_h_l1502_c30_7749 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_ins,
sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_x,
sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_y,
sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1505_c31_76b4
CONST_SR_8_uxn_opcodes_h_l1505_c31_76b4 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1505_c31_76b4_x,
CONST_SR_8_uxn_opcodes_h_l1505_c31_76b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_left,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_right,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_cond,
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_e1e8
BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_e1e8 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_e1e8_left,
BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_e1e8_right,
BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_e1e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1512_c11_ec05
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_ec05 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_ec05_left,
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_ec05_right,
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_ec05_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_return_output,
 n16_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output,
 t8_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_return_output,
 n16_MUX_uxn_opcodes_h_l1488_c7_000c_return_output,
 t8_MUX_uxn_opcodes_h_l1488_c7_000c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_return_output,
 n16_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output,
 t8_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_return_output,
 n16_MUX_uxn_opcodes_h_l1495_c7_be43_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_return_output,
 CONST_SL_8_uxn_opcodes_h_l1497_c3_e9d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_return_output,
 n16_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1500_c3_b82c_return_output,
 sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_return_output,
 CONST_SR_8_uxn_opcodes_h_l1505_c31_76b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_e1e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1512_c11_ec05_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1488_c7_000c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1483_c2_0e50_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1488_c7_000c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1483_c2_0e50_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_a55d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1484_c3_73f6_uxn_opcodes_h_l1484_c3_73f6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1488_c7_000c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1488_c7_000c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_c375 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1495_c7_be43_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1491_c7_fb80_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1491_c7_fb80_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_c08f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1491_c7_fb80_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1495_c7_be43_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_e9d4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_e9d4_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1499_c7_1f55_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_b82c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_b82c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_b82c_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1504_c22_eddb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_76b4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_76b4_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1505_c21_4b75_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_e1e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_e1e8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_e1e8_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1509_c22_d9e4_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1510_c21_ae2d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_ec05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_ec05_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_ec05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_7460_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1512_l1507_l1495_DUPLICATE_03cf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_235c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1499_l1495_DUPLICATE_eb53_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_cbd3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1491_l1488_l1512_l1507_l1499_l1495_DUPLICATE_18bc_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1496_l1500_DUPLICATE_df48_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ed17_uxn_opcodes_h_l1477_l1517_DUPLICATE_fc0a_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_c08f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_c08f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_a55d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_a55d;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_e1e8_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_c375 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_c375;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_ec05_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_b82c_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_ec05_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_e1e8_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1483_c6_0b81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_left;
     BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_return_output := BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1510_c21_ae2d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1510_c21_ae2d_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1496_l1500_DUPLICATE_df48 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1496_l1500_DUPLICATE_df48_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1491_c11_3f13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_left;
     BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_return_output := BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_cbd3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_cbd3_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1491_l1488_l1512_l1507_l1499_l1495_DUPLICATE_18bc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1491_l1488_l1512_l1507_l1499_l1495_DUPLICATE_18bc_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1495_c11_81ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_7460 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_7460_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1488_c11_452b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1509_c33_e1e8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_e1e8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_e1e8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_e1e8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_e1e8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_e1e8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_e1e8_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1499_l1495_DUPLICATE_eb53 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1499_l1495_DUPLICATE_eb53_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1504_c22_eddb] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1504_c22_eddb_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_235c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_235c_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1512_c11_ec05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1512_c11_ec05_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_ec05_left;
     BIN_OP_EQ_uxn_opcodes_h_l1512_c11_ec05_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_ec05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_ec05_return_output := BIN_OP_EQ_uxn_opcodes_h_l1512_c11_ec05_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1512_l1507_l1495_DUPLICATE_03cf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1512_l1507_l1495_DUPLICATE_03cf_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1499_c11_0547] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_left;
     BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_return_output := BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1502_c30_7749] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_ins;
     sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_x;
     sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_return_output := sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_7845] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_left;
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_return_output := BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1491_c7_fb80] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1491_c7_fb80_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1483_c2_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1483_c2_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_0b81_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1488_c7_000c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1488_c7_000c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_452b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1491_c7_fb80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1491_c7_fb80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_3f13_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1495_c7_be43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_81ac_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1499_c7_1f55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_0547_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7845_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_ec05_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_ec05_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1504_c22_eddb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_b82c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1496_l1500_DUPLICATE_df48_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_e9d4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1496_l1500_DUPLICATE_df48_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1510_c21_ae2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1499_l1495_DUPLICATE_eb53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1499_l1495_DUPLICATE_eb53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1499_l1495_DUPLICATE_eb53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1499_l1495_DUPLICATE_eb53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1499_l1495_DUPLICATE_eb53_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_235c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_235c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_235c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_235c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_235c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1491_l1488_l1512_l1507_l1499_l1495_DUPLICATE_18bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1491_l1488_l1512_l1507_l1499_l1495_DUPLICATE_18bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1491_l1488_l1512_l1507_l1499_l1495_DUPLICATE_18bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1491_l1488_l1512_l1507_l1499_l1495_DUPLICATE_18bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1491_l1488_l1512_l1507_l1499_l1495_DUPLICATE_18bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1491_l1488_l1512_l1507_l1499_l1495_DUPLICATE_18bc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1512_l1507_l1495_DUPLICATE_03cf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1512_l1507_l1495_DUPLICATE_03cf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1512_l1507_l1495_DUPLICATE_03cf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1512_l1507_l1495_DUPLICATE_03cf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1512_l1507_l1495_DUPLICATE_03cf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1512_l1507_l1495_DUPLICATE_03cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_7460_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_7460_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_7460_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_7460_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_7460_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_cbd3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_cbd3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_cbd3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_cbd3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1491_l1488_l1483_l1507_l1495_DUPLICATE_cbd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1491_c7_fb80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_7749_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1507_c7_5de9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1507_c7_5de9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1509_c22_d9e4] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1509_c22_d9e4_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_e1e8_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1491_c7_fb80] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output;

     -- t8_MUX[uxn_opcodes_h_l1491_c7_fb80] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1491_c7_fb80_cond <= VAR_t8_MUX_uxn_opcodes_h_l1491_c7_fb80_cond;
     t8_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue;
     t8_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output := t8_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1500_c3_b82c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1500_c3_b82c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_b82c_left;
     BIN_OP_OR_uxn_opcodes_h_l1500_c3_b82c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_b82c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_b82c_return_output := BIN_OP_OR_uxn_opcodes_h_l1500_c3_b82c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1497_c3_e9d4] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1497_c3_e9d4_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_e9d4_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_e9d4_return_output := CONST_SL_8_uxn_opcodes_h_l1497_c3_e9d4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1483_c1_f1ab] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1512_c7_153d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1512_c7_153d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1499_c7_1f55] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output;

     -- Submodule level 2
     VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_76b4_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_b82c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_b82c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1509_c22_d9e4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_e9d4_return_output;
     VAR_printf_uxn_opcodes_h_l1484_c3_73f6_uxn_opcodes_h_l1484_c3_73f6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f1ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_153d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_153d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output;
     -- t8_MUX[uxn_opcodes_h_l1488_c7_000c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1488_c7_000c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1488_c7_000c_cond;
     t8_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue;
     t8_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1488_c7_000c_return_output := t8_MUX_uxn_opcodes_h_l1488_c7_000c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1488_c7_000c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_return_output;

     -- printf_uxn_opcodes_h_l1484_c3_73f6[uxn_opcodes_h_l1484_c3_73f6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1484_c3_73f6_uxn_opcodes_h_l1484_c3_73f6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1484_c3_73f6_uxn_opcodes_h_l1484_c3_73f6_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1499_c7_1f55] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1495_c7_be43] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1507_c7_5de9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output := result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_5de9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1505_c31_76b4] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1505_c31_76b4_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_76b4_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_76b4_return_output := CONST_SR_8_uxn_opcodes_h_l1505_c31_76b4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1507_c7_5de9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1499_c7_1f55] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1499_c7_1f55_cond <= VAR_n16_MUX_uxn_opcodes_h_l1499_c7_1f55_cond;
     n16_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue;
     n16_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output := n16_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_be43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_000c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_5de9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1488_c7_000c_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1499_c7_1f55] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1495_c7_be43] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_return_output;

     -- n16_MUX[uxn_opcodes_h_l1495_c7_be43] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1495_c7_be43_cond <= VAR_n16_MUX_uxn_opcodes_h_l1495_c7_be43_cond;
     n16_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue;
     n16_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1495_c7_be43_return_output := n16_MUX_uxn_opcodes_h_l1495_c7_be43_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1499_c7_1f55] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output := result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output;

     -- t8_MUX[uxn_opcodes_h_l1483_c2_0e50] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1483_c2_0e50_cond <= VAR_t8_MUX_uxn_opcodes_h_l1483_c2_0e50_cond;
     t8_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue;
     t8_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output := t8_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1491_c7_fb80] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1483_c2_0e50] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1505_c21_4b75] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1505_c21_4b75_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_76b4_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1499_c7_1f55] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1505_c21_4b75_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1495_c7_be43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_be43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1495_c7_be43] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_return_output := result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1495_c7_be43] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1495_c7_be43] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1488_c7_000c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1491_c7_fb80] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1491_c7_fb80_cond <= VAR_n16_MUX_uxn_opcodes_h_l1491_c7_fb80_cond;
     n16_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue;
     n16_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output := n16_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1491_c7_fb80] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1499_c7_1f55] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output := result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_be43_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_be43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_000c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_be43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_1f55_return_output;
     -- n16_MUX[uxn_opcodes_h_l1488_c7_000c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1488_c7_000c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1488_c7_000c_cond;
     n16_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue;
     n16_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1488_c7_000c_return_output := n16_MUX_uxn_opcodes_h_l1488_c7_000c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1491_c7_fb80] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1491_c7_fb80] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1483_c2_0e50] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1488_c7_000c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1491_c7_fb80] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output := result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1495_c7_be43] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_return_output := result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1488_c7_000c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_000c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_be43_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1483_c2_0e50] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1491_c7_fb80] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output := result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output;

     -- n16_MUX[uxn_opcodes_h_l1483_c2_0e50] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1483_c2_0e50_cond <= VAR_n16_MUX_uxn_opcodes_h_l1483_c2_0e50_cond;
     n16_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue;
     n16_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output := n16_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1488_c7_000c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1488_c7_000c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1488_c7_000c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_000c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_000c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_000c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_fb80_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1483_c2_0e50] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1483_c2_0e50] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output := result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1483_c2_0e50] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1488_c7_000c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_000c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1483_c2_0e50] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output := result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ed17_uxn_opcodes_h_l1477_l1517_DUPLICATE_fc0a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ed17_uxn_opcodes_h_l1477_l1517_DUPLICATE_fc0a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ed17(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_0e50_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ed17_uxn_opcodes_h_l1477_l1517_DUPLICATE_fc0a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ed17_uxn_opcodes_h_l1477_l1517_DUPLICATE_fc0a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
